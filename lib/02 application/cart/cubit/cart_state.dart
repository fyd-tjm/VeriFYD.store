part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState({
    required Cart? cartRealtime,
    required List<Tuple3>? cartItemsInTuple3,
    required Map<String, Product>? cartItemsDetail,
    required bool updating,
    required Option<CartFailure> failure,
  }) = _CartState;

  factory CartState.initial() => CartState(
        updating: false,
        cartItemsDetail: null,
        cartRealtime: null,
        cartItemsInTuple3: null,
        failure: none(),
      );
}
