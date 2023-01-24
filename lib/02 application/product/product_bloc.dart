import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/02%20application/cart/cubit/cart_cubit.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
//?-----------------------------------------------------------------------------
  final IStoreRepository _iStoreRepo;
  final ICartRepository _iCartRepo;
  final CartCubit _cartCubit;
  final FydUserCubit _fydUserCubit;
  final SharedInfoCubit _sharedInfoCubit;

  StreamSubscription<Either<ProductFailure, Product>>? _subscription;
//?-----------------------------------------------------------------------------
  ProductBloc(this._iStoreRepo, this._iCartRepo, this._cartCubit,
      this._fydUserCubit, this._sharedInfoCubit)
      : super(ProductState.initial()) {
    String? cartRef;

//?--Get-Product-In-Realtime----------------------------------------------------

    on<GetProductRealtime>((event, emit) {
      //------
      cartRef = Helpers.getCartRef(userId: _fydUserCubit.state.fydUser!.uId);
      if (_cartCubit.state.cartRealtime == null) {
        _cartCubit.initializeCart();
      }
      //------
      _subscription?.cancel();
      //------
      _subscription = _iStoreRepo
          .getProductRealTime(productRef: event.productRef)
          .listen((failureOrProduct) =>
              add(RecievedStreamEvent(event: failureOrProduct)));
      //------
    });

//?--Recieved-Stream-Event------------------------------------------------------

    on<RecievedStreamEvent>((event, emit) {
      event.event.fold(
        (productFailure) {
          emit(
              state.copyWith(isFetching: false, failure: some(productFailure)));
          add(const ToggleFailures());
        },
        (store) => emit(state.copyWith(
            isFetching: false, productRealtime: store, failure: none())),
      );
    });

//?-----------------------------------------------------------------------------
    on<ToggleFailures>((event, emit) {
      emit(state.copyWith(failure: none()));
    });

//?--Toggle-Permission-State----------------------------------------------------
    on<ToggleStates>((event, emit) {
      emit(state.copyWith(
          newCartPermissionState: false,
          cartFailureOrSuccess: none(),
          failure: none()));
    });

//?--Add-To-Cart----------------------------------------------------------------

    on<AddToCart>((event, emit) {
      //------
      emit(state.copyWith(addingToCart: true, cartFailureOrSuccess: none()));
      //------
      final productsStoreId = state.productRealtime!.storeId;
      final cartId = _cartCubit.state.cartRealtime!.cartId;

      if (cartId != productsStoreId) {
        if (cartId.isEmpty) {
          add(AddNewCartWithProduct(size: event.size));
        }
        // emit Permission State--to remove existing cart
        else {
          emit(state.copyWith(
            addingToCart: false,
            newCartPermissionState: true,
          ));
          add(const ToggleStates());
        }
      } else {
        final cartLimit = _sharedInfoCubit.state.sharedInfo!.cartLimit;
        final cartCount = _cartCubit.state.cartRealtime!.cartCount;
        if (cartCount == cartLimit) {
          // cArtfailure for CartLimit full
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(const CartFailure.maxCartLimit())),
          ));
          add(const ToggleStates());
        } else {
          //? Product-existence in Cart check
          //-------
          final productSku = state.productRealtime!.skuId;
          final cartItems = _cartCubit.state.cartRealtime!.cartItems;
          if (cartItems.keys.contains(productSku) == false) {
            //Inject addNewProduct Event
            add(ProductEvent.addNewProduct(
                skuId: productSku, size: event.size));
          } else {
            if (cartItems[productSku]!.containsKey(event.size) == false) {
              //Inject addNewProduct Event
              add(ProductEvent.addNewProduct(
                  skuId: productSku, size: event.size));
            } else {
              //? onSameSize-TotalQty-Availability-Check
              //-------
              final qtyInCart = cartItems[productSku]![event.size]!;
              final availableQty =
                  state.productRealtime!.sizeAvailability[event.size]!;
              if (qtyInCart < availableQty) {
                //Inject addSameSize Event
                add(ProductEvent.addSameProduct(
                    skuId: productSku, size: event.size));
              } else {
                emit(state.copyWith(
                  addingToCart: false,
                  cartFailureOrSuccess:
                      some(left(const CartFailure.maxItemAvailability())),
                ));
                add(const ToggleStates());
              }
              //-------
            }
          }
          //-------
        }
      }
      //-------
    });

//?-----------------------------------------------------------------------------
    on<AddNewCartWithProduct>((event, emit) async {
      emit(state.copyWith(addingToCart: true, cartFailureOrSuccess: none()));
      //------

      final productsStoreId = state.productRealtime!.storeId;
      final productsStoreName = state.productRealtime!.storeName;
      final productSkuId = state.productRealtime!.skuId;
      //------
      final newCart = Cart(
        cartId: productsStoreId,
        storeName: productsStoreName,
        cartCount: 1,
        cartItems: {
          productSkuId: {event.size: 1}
        },
      );
      //------
      final result = await _iCartRepo.addNewCart(cart: newCart);
      //------
      result.fold(
        (cartFailure) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ));
          add(const ToggleStates());
        },
        (success) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ));
          add(const ToggleStates());
        },
      );
      //-----
    });

//?-----------------------------------------------------------------------------
    on<AddNewProduct>((event, emit) async {
      //------
      final productSizeQty = {event.size: 1};

      final result = await _iCartRepo.addNewProduct(
          skuId: event.skuId, sizeQty: productSizeQty);

      result.fold(
        (cartFailure) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ));
          add(const ToggleStates());
        },
        (success) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ));
          add(const ToggleStates());
        },
      );
    });

//?-----------------------------------------------------------------------------
    on<AddSameProduct>((event, emit) async {
      //------
      final result = await _iCartRepo.updateSize(
          skuId: event.skuId, size: event.size, updateBy: 1);

      result.fold(
        (cartFailure) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ));
          add(const ToggleStates());
        },
        (success) {
          emit(state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ));
          add(const ToggleStates());
        },
      );
    });

//?-----------------------------------------------------------------------------
  } // super
//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
} // productBloc
