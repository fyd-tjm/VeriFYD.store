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
    required bool loadingMore,
  }) = _StoreState;
  factory StoreState.initial() => StoreState(
        isFetching: false,
        selectedType: null,
        storeRealtime: null,
        productList: [],
        notAvailable: false,
        failure: none(),
        loadingMore: false,
      );
}