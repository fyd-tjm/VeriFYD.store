part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const StoreState._();
  const factory StoreState({
    required bool isFetching,
    required String? selectedType,
    required Store? storeRealtime,
    required List<Product> productList,
    required bool notAvailable,
    required Option<Either<StoreFailure, ProductFailure>> failure,
  }) = _StoreState;
  factory StoreState.initial() => StoreState(
        isFetching: true,
        selectedType: null,
        storeRealtime: null,
        productList: [],
        notAvailable: false,
        failure: none(),
      );
}
