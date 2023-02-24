import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../../03 domain/cart/cart.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

@LazySingleton()
class CartCubit extends Cubit<CartState> {
  final ICartRepository _iCartRepo;
  final IStoreRepository _iStoreRepo;
  final SharedInfoCubit _sharedInfoCubit;
  StreamSubscription<Either<CartFailure, Cart>>? _subscription;
//?-----------------------------------------------------------------------------
  CartCubit(this._iCartRepo, this._iStoreRepo, this._sharedInfoCubit)
      : super(CartState.initial());

//?-----------------------------------------------------------------------------
  void initializeCart() async {
    //------
    emit(CartState.initial().copyWith(updating: true));
    // cancel subs if active
    _subscription?.cancel();
    _subscription = _iCartRepo.getCartRealtime().listen((cartOrFailure) {
      _handleStreamEvent(cartOrFailure);
    });
  }

//---------------

  void _handleStreamEvent(Either<CartFailure, Cart> event) {
    // log('handleCartEvent');
    event.fold(
      (failure) {
        emit(state.copyWith(updating: false, failure: some((failure))));
        failureStateReset();
      },
      (cart) {
        // update cartItemsInTuple3 state [<Tuple3>(sku, size, qty)]
        // update cartRealtime state
        // update cartItemsDetail state if new sku in cart
        //-----
        final cartItemsInTuple3 = <Tuple3>[];
        cart.cartItems.forEach(
          (sku, sizeQty) => sizeQty.forEach(
            (size, qty) => cartItemsInTuple3.add(Tuple3(sku, size, qty)),
          ),
        );
        // check if getCartItemsDetails<Event> needs to be triggered
        // if cartItemsDetails is null <OR> it does not have sku as key
        //------
        if ((state.cartItemsDetail == null) ||
            ((cartItemsInTuple3.every((cartItem) =>
                    state.cartItemsDetail!.containsKey(cartItem.value1))) ==
                false)) {
          getCartItemsDetail(cart: cart, cartItemsInTuple3: cartItemsInTuple3);
        }
        // else update cartRealtime/cartItems states
        //------
        else {
          emit(state.copyWith(
            updating: false,
            cartRealtime: cart,
            cartItemsInTuple3: cartItemsInTuple3,
            failure: none(),
          ));
        }
        //------
      },
    );
  }

//?-----------------------------------------------------------------------------
  Future<void> getCartItemsDetail({
    required Cart cart,
    required List<Tuple3> cartItemsInTuple3,
  }) async {
    // for each sku in cartItems there must be a key<sku> in productDetails state
    // if not add key<sku> and its value<Product>
    // at last emit cartRealtime, cartItems, productDetails states
    //------

    List<String> missingSku = [];
    final Map<String, Product> cartItemsDetail = (state.cartItemsDetail == null)
        ? {}
        : Map<String, Product>.from(state.cartItemsDetail!.cast());
    // check if productDetails is null => (1): add all sku to missingSku list
    //------
    if (state.cartItemsDetail == null) {
      missingSku = cartItemsInTuple3
          .map((tuple3) => tuple3.value1)
          .toList()
          .cast<String>();
    }
    // check which <sku-product> to add in productDetails
    //-----
    else {
      for (var cartItem in cartItemsInTuple3) {
        if (state.cartItemsDetail!.keys.contains(cartItem.value1) == false) {
          missingSku.add(cartItem.value1);
        }
      }
    }
    // get product for each missing sku and add to productDetails
    //------
    for (var sku in missingSku) {
      await _iStoreRepo
          .getProduct(
              productRef:
                  Helpers.getProductRef(storeId: cart.cartId, skuId: sku))
          .then((productOrFailure) => productOrFailure.fold(
                (productFailure) {
                  emit(state.copyWith(
                    failure: some(const CartFailure.itemsDetailFailure()),
                  ));
                  const ToggleFailureOrSuccess();
                },
                (product) => cartItemsDetail.addAll({sku: product}),
              ));
    }
    //-----
    emit(state.copyWith(
      updating: false,
      cartRealtime: cart,
      cartItemsInTuple3: cartItemsInTuple3,
      cartItemsDetail: cartItemsDetail,
    ));
    //------
  }

//?-----------------------------------------------------------------------------
  Future<bool> cartAvailabilityCheck() async {
    //------
    emit(state.copyWith(updating: true, failure: none()));
    await Future.delayed(const Duration(milliseconds: 900));
    //------
    // 1) for each sku in cartitem fetch Product
    final Map<String, Product> cartItemsDetail = {};
    final List<String> skusInCart = state.cartItemsInTuple3!
        .map((cartItem) => cartItem.value1)
        .toSet()
        .toList()
        .cast();
    for (var sku in skusInCart) {
      await _iStoreRepo
          .getProduct(
              productRef: Helpers.getProductRef(
                  storeId: state.cartRealtime!.cartId, skuId: sku))
          .then((productOrFailure) => productOrFailure.fold(
                (productFailure) {
                  emit(state.copyWith(
                    failure: some(const CartFailure.availabilityCheckFailure()),
                  ));
                  const ToggleFailureOrSuccess();
                },
                (product) => cartItemsDetail.addAll({sku: product}),
              ));
    }
    //------
    // 2) compare cartitem-qty with ProductAvailability
    for (var cartItem in state.cartItemsInTuple3!) {
      final sizeAvailability =
          cartItemsDetail[cartItem.value1]!.sizeAvailability[cartItem.value2]!;
      //------
      // if Not-availaible
      // update ProductDetails and return false
      if ((sizeAvailability >= cartItem.value3) == false) {
        emit(state.copyWith(
          updating: false,
          cartItemsDetail: cartItemsDetail,
          failure: none(),
        ));
        return false;
      }
    }
    //------
    // 3) update ProductDetails state and return true
    emit(state.copyWith(
      updating: false,
      cartItemsDetail: cartItemsDetail,
      failure: none(),
    ));
    return true;
    //------
  }

//?-----------------------------------------------------------------------------
  void clearCart() async {
    // log('clearCart');
    emit(state.copyWith(updating: true));
    //------
    await Future.delayed(const Duration(milliseconds: 900));

    await _iCartRepo
        .clearCart()
        .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
              (cartFailure) {
                emit(state.copyWith(
                  updating: false,
                  failure: some((cartFailure)),
                ));
                failureStateReset();
              },
              (success) => emit(state.copyWith(
                updating: false,
                failure: none(),
              )),
            ));
    //------
  }

//?-----------------------------------------------------------------------------
  void updateQty({
    required Tuple3 cartItem,
    required int updateBy,
  }) async {
    // check if updateBy is +/-
    // (+ve): check availability via productsDetail
    // (-ve): check if only 1 QTY IN CART
    // if true: then remove THE SIZE
    //   else : DECREASE SIZE QTY
    if (state.updating) return;
    emit(state.copyWith(updating: true, failure: none()));
    //-----
    await Future.delayed(const Duration(milliseconds: 900));
    //-----
    if (updateBy.isNegative) {
      // when updateBy is -1
      if (cartItem.value3 > 1) {
        // qty > 1 and updateBy -1
        await _iCartRepo
            .updateSize(
                skuId: cartItem.value1, size: cartItem.value2, updateBy: -1)
            .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
                  (cartFailure) {
                    emit(state.copyWith(
                      updating: false,
                      failure: some((cartFailure)),
                    ));
                    failureStateReset();
                  },
                  (success) => emit(state.copyWith(
                    updating: false,
                    failure: none(),
                  )),
                ));
      } else {
        // qty =1 and updateBy is -1
        removeSize(cartItem: cartItem, qtyToBeRemoved: 1);
      }
    } // when updateBy is +1
    else {
      if (state.cartRealtime!.cartCount ==
          _sharedInfoCubit.state.sharedInfo!.cartLimit) {
        emit(state.copyWith(
            updating: false, failure: some(const CartFailure.maxCartLimit())));
        const ToggleFailureOrSuccess();
        return;
      }

      final sizeAvailability = state.cartItemsDetail![cartItem.value1]!
          .sizeAvailability[cartItem.value2]!;
      //------
      if (sizeAvailability > cartItem.value3) {
        // if size available
        await _iCartRepo
            .updateSize(
                skuId: cartItem.value1,
                size: cartItem.value2,
                updateBy: updateBy)
            .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
                  (cartFailure) {
                    emit(state.copyWith(
                      updating: false,
                      failure: some((cartFailure)),
                    ));
                    failureStateReset();
                  },
                  (success) => emit(state.copyWith(
                    updating: false,
                    failure: none(),
                  )),
                ));
      } else {
        // when max available qty of product has been added to cart
        emit(state.copyWith(
          updating: false,
          failure: some((const CartFailure.maxItemAvailability())),
        ));
        failureStateReset();
      }
    }
  }

//?-----------------------------------------------------------------------------
  void removeSize({
    required Tuple3 cartItem,
    required int qtyToBeRemoved,
  }) async {
    if (state.updating) return;
    //------
    emit(state.copyWith(updating: true, failure: none()));
    await Future.delayed(const Duration(milliseconds: 900));
    //------
    await _iCartRepo
        .removeSize(
            skuId: cartItem.value1,
            size: cartItem.value2,
            removedQty: qtyToBeRemoved)
        .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
              (cartFailure) {
                emit(state.copyWith(
                  updating: false,
                  failure: some((cartFailure)),
                ));
                failureStateReset();
              },
              (success) => emit(state.copyWith(
                updating: false,
                failure: none(),
              )),
            ));
    //------
  }

//?-----------------------------------------------------------------------------
  void failureStateReset() {
    emit(state.copyWith(failure: none()));
  }

//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
