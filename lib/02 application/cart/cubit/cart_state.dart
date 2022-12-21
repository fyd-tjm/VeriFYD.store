part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState({
    required bool isFetching,
    required Cart? cartRealtime,
    required bool updating,
    required Map<String, Product> productDetails,
    required Option<Either<CartFailure, ProductFailure>> failure,
  }) = _CartState;

  factory CartState.initial() => CartState(
        isFetching: true,
        updating: false,
        productDetails: {},
        cartRealtime: null,
        failure: none(),
      );
}
