import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/02%20application/cart/cubit/cart_cubit.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

//TODO: CartRef-Add-Via-userDoc/Bloc
const cartRef = 'users/6yQEkmtw9uIed83psnEpkt6rw6AV/cart/4OsMh8URJm3Xyf3u9w1I';
const cartLimit = 10;
const productsCollectionRef = 'stores/#W12R/products';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
//?-----------------------------------------------------------------------------
  final IStoreRepository _iStoreRepo;
  final ICartRepository _iCartRepo;
  final CartCubit _cartCubit;
  StreamSubscription<Either<ProductFailure, Product>>? _subscription;
//?-----------------------------------------------------------------------------
  ProductBloc(this._iStoreRepo, this._iCartRepo, this._cartCubit)
      : super(ProductState.initial()) {
//?--Get-Product-In-Realtime----------------------------------------------------
    on<GetProductRealtime>((event, emit) {
      emit(state.copyWith(
        isFetching: true,
        failure: none(),
      ));
      _subscription?.cancel();
      _subscription = _iStoreRepo
          .getProductRealTime(productsReference: event.productRef)
          .listen(
            (failureOrProduct) =>
                add(RecievedStreamEvent(event: failureOrProduct)),
          );
    });

//?--Recieved-Stream-Event------------------------------------------------------
    on<RecievedStreamEvent>((event, emit) {
      emit(
        event.event.fold(
          (productFailure) => state.copyWith(
            isFetching: false,
            failure: some(productFailure),
          ),
          (store) => state.copyWith(
            isFetching: false,
            productRealtime: store,
            failure: none(),
          ),
        ),
      );
    });

//?--Toggle-Permission-State----------------------------------------------------
    on<ToggleStates>((event, emit) {
      emit(state.copyWith(
        newCartPermissionState: false,
        cartFailureOrSuccess: none(),
        failure: none(),
      ));
    });
//?--Add-To-Cart----------------------------------------------------------------
    on<AddToCart>((event, emit) {
      emit(state.copyWith(addingToCart: true, cartFailureOrSuccess: none()));
      // Cart-Availability-check and CartLimit-check
      //-------
      log('1');
      final productsStoreId = state.productRealtime!.storeId;
      final cartId = _cartCubit.state.cartRealtime!.cartId;
      if (cartId != productsStoreId) {
        log('2');
        // emit Permission State--to remove existing cart
        emit(
          state.copyWith(
            addingToCart: false,
            newCartPermissionState: true,
            cartFailureOrSuccess: none(),
          ),
        );
      } else {
        log('3');
        final cartLimit = _cartCubit.state.cartRealtime!.cartLimit;
        final cartCount = _cartCubit.state.cartRealtime!.cartCount;
        if (cartCount == cartLimit) {
          log('4');
          // cArtfailure for CartLimit full
          emit(
            state.copyWith(
              addingToCart: false,
              cartFailureOrSuccess:
                  some(left(const CartFailure.maxCartLimit())),
            ),
          );
        } else {
          log('5');
          //? Product-existence in Cart check
          //-------
          final productSku = state.productRealtime!.skuId;
          final cartMap = _cartCubit.state.cartRealtime!.cartMap;
          if (cartMap.keys.contains(productSku) == false) {
            log('6');
            //Inject addNewProduct Event
            add(ProductEvent.addNewProduct(
                skuId: productSku, size: event.size));
          } else {
            log('7');
            if (cartMap[productSku]!.containsKey(event.size) == false) {
              log('8');
              //Inject addNewProduct Event
              add(ProductEvent.addNewProduct(
                  skuId: productSku, size: event.size));
            } else {
              log('9');
              //? onSameSize-TotalQty-Availability-Check
              //-------
              final qtyInCart = cartMap[productSku]![event.size]!;
              final availableQty =
                  state.productRealtime!.sizeAvailability[event.size]!;
              if (qtyInCart < availableQty) {
                log('10');
                //Inject addSameSize Event
                add(ProductEvent.addSameProduct(
                    skuId: productSku, size: event.size));
              } else {
                log('11');
                emit(
                  state.copyWith(
                    addingToCart: false,
                    cartFailureOrSuccess:
                        some(left(const CartFailure.maxItemAvailability())),
                  ),
                );
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
      const productsColRef = productsCollectionRef;
      final productsStoreId = state.productRealtime!.storeId;
      final productSkuId = state.productRealtime!.skuId;
      //------
      final newCart = Cart(
        cartId: productsStoreId,
        cartLimit: cartLimit,
        cartCount: 1,
        productsCollectionReference: productsColRef,
        cartMap: {
          productSkuId: {event.size: 1}
        },
      );
      //------
      final result =
          await _iCartRepo.addNewCart(cartRef: cartRef, cart: newCart);
      //------
      result.fold(
        (cartFailure) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ),
        ),
        (success) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ),
        ),
      );
      //-----
    });

//?-----------------------------------------------------------------------------
    on<AddNewProduct>((event, emit) async {
      final productSizeQty = {event.size: 1};

      final result = await _iCartRepo.addNewProduct(
          cartRef: cartRef, skuId: event.skuId, sizeQty: productSizeQty);

      result.fold(
        (cartFailure) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ),
        ),
        (success) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ),
        ),
      );
    });

//?-----------------------------------------------------------------------------
    on<AddSameProduct>((event, emit) async {
      final result = await _iCartRepo.updateSize(
          cartRef: cartRef, skuId: event.skuId, size: event.size, updateBy: 1);

      result.fold(
        (cartFailure) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(left(cartFailure)),
          ),
        ),
        (success) => emit(
          state.copyWith(
            addingToCart: false,
            cartFailureOrSuccess: some(right(success)),
          ),
        ),
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
