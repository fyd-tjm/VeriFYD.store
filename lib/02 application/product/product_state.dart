part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const ProductState._();
  const factory ProductState({
    required bool isFetching,
    required Option<ProductFailure> failure,
    required Product? productRealtime,
    required bool addingToCart,
    required bool newCartPermissionState,
    required Option<Either<CartFailure, Unit>> cartFailureOrSuccess,
  }) = _ProductState;
  factory ProductState.initial() => ProductState(
      isFetching: true,
      failure: none(),
      productRealtime: null,
      addingToCart: false,
      newCartPermissionState: false,
      cartFailureOrSuccess: none());
}
