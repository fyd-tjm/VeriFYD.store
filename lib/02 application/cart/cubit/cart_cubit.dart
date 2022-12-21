import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

import '../../../03 domain/cart/cart.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

const cartRef = 'users/6yQEkmtw9uIed83psnEpkt6rw6AV/cart/4OsMh8URJm3Xyf3u9w1I';

@singleton
class CartCubit extends Cubit<CartState> {
  final ICartRepository _iCartRepo;
  final IStoreRepository _iStoreRepo;
  StreamSubscription<Either<CartFailure, Cart>>? _subscription;
//?-----------------------------------------------------------------------------
  CartCubit(this._iCartRepo, this._iStoreRepo) : super(CartState.initial()) {
    getCartRealtime(cartRef: cartRef); //Todo: add cartRef
  }
//?-----------------------------------------------------------------------------
  void getCartRealtime({required String cartRef}) async {
    // log('getCartREaltime');
    emit(state.copyWith(isFetching: true, failure: none()));
    // cancel subs if active
    _subscription?.cancel();
    // start listening to stream via cartRepo
    _subscription =
        _iCartRepo.getCartRealtime(cartRef: cartRef).listen((cartOrFailure) {
      _handleStreamEvent(cartOrFailure);
    });
  }

//-------
  void _handleStreamEvent(Either<CartFailure, Cart> event) {
    // log('handleCartEvent');
    // log(event.toString());
    event.fold(
      (failure) =>
          emit(state.copyWith(isFetching: false, failure: some(left(failure)))),
      (cart) {
        emit(
          state.copyWith(
              cartRealtime: cart, isFetching: false, failure: none()),
        );
        getCartProductsDetails(); //TODO: do not call from here..only for testing
      },
    );
  }

//?-----------------------------------------------------------------------------
  void getCartProductsDetails() async {
    emit(state.copyWith(
      // isFetching: true,
      failure: none(),
      // productDetails: {},
      updating: true,
    ));
    // log('get-PRoduct-Details');
    // get all skus from cartMap
    // for each sku get product
    // and store it under productDetails Map with sku as its key
    //------
    final storeId = state.cartRealtime!.cartId;
    final filterCartMapEntries = state.cartRealtime!.cartMap.entries
        .where((entry) => entry.value.isNotEmpty);
    final skuInCart = Map.fromEntries(filterCartMapEntries);

    final productDetailMap = <String, Product>{};
    for (var i = 0; i < skuInCart.length; i++) {
      await _iStoreRepo
          .getProductBySkuId(
              storeId: storeId, skuId: skuInCart.keys.elementAt(i))
          .then((productOrFailure) => productOrFailure.fold(
                (failure) => log(failure.toString()), //todo product failure
                (product) => productDetailMap
                    .addAll({skuInCart.keys.elementAt(i): product}),
              ))
          .onError((error, stackTrace) => log(error.toString()));
    }
    //------
    emit(state.copyWith(
      productDetails: productDetailMap,
      updating: false,
    ));
  }

//?-----------------------------------------------------------------------------
  void toggleStates() {
    // log('toggleStates');
    emit(state.copyWith(failure: none()));
  }

//?-----------------------------------------------------------------------------
  void clearCart() async {
    // log('clearCart');
    emit(state.copyWith(
      updating: true,
    ));
    await _iCartRepo.clearCart(cartRef: cartRef);
    emit(state.copyWith(updating: false));
  }

//?-----------------------------------------------------------------------------
  void updateQty(
      {required String skuId,
      required String size,
      required int updateBy}) async {
    // check if updateBy is +/-
    // (+ve): check availability via productsDetail
    // (-ve): check if only 1 QTY IN CART
    // if true: then remove THE SIZE
    //   else : DECREASE SIZE QTY
    emit(state.copyWith(updating: true, failure: none()));
    // log('Update-qty');

    if (updateBy.isNegative) {
      // log('1');
      // when updateBy is -1
      final totalQtyInCart = state.cartRealtime!.cartMap[skuId]![size]!;
      if (totalQtyInCart > 1) {
        // log('2');
        // greater than 1 qty in cart and update by is -1
        await _iCartRepo
            .updateSize(
                cartRef: cartRef, skuId: skuId, size: size, updateBy: updateBy)
            .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
                  (cartFailure) => emit(
                    state.copyWith(
                      updating: false,
                      failure: some(left(cartFailure)),
                    ),
                  ),
                  (success) => emit(
                    state.copyWith(
                      updating: false,
                      failure: none(),
                    ),
                  ),
                ));
      } else {
        // log('3');
        // only 1 qty in cart and update by is -1
        //todo: remove size
        removeSize(skuId: skuId, size: size, qtyToBeRemoved: 1);
      }
    } else {
      // log('4');
      // when updateBy is +1
      final sizeAvailability =
          state.productDetails[skuId]!.sizeAvailability[size]!;
      final qtyInCart = state.cartRealtime!.cartMap[skuId]![size]!;

      if (sizeAvailability > qtyInCart) {
        // log('5');
        // if size available to be added call update size via repo
        await _iCartRepo
            .updateSize(
                cartRef: cartRef, skuId: skuId, size: size, updateBy: updateBy)
            .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
                  (cartFailure) => emit(
                    state.copyWith(
                      updating: false,
                      failure: some(left(cartFailure)),
                    ),
                  ),
                  (success) => emit(
                    state.copyWith(
                      updating: false,
                      failure: none(),
                    ),
                  ),
                ));
      } else {
        // log('6');
        // when max available qty of product has been added to cart
        emit(
          state.copyWith(
            updating: false,
            failure: some(left(const CartFailure.maxItemAvailability())),
          ),
        );
      }
    }
  }

//?-----------------------------------------------------------------------------
  void removeSize(
      {required String skuId,
      required String size,
      required int qtyToBeRemoved}) async {
    emit(state.copyWith(updating: true, failure: none()));
    // log('remove-size');
    await _iCartRepo
        .removeSize(
            cartRef: cartRef,
            skuId: skuId,
            size: size,
            removedQty: qtyToBeRemoved)
        .then((cartFailureOrSuccess) => cartFailureOrSuccess.fold(
              (cartFailure) => emit(
                state.copyWith(
                  updating: false,
                  failure: some(left(cartFailure)),
                ),
              ),
              (success) => emit(
                state.copyWith(
                  updating: false,
                  failure: none(),
                ),
              ),
            ));
  }

//?-----------------------------------------------------------------------------
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
//?-----------------------------------------------------------------------------
}
