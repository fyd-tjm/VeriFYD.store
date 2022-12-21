part of 'stores_bloc.dart';

@freezed
class StoresState with _$StoresState {
  const StoresState._();
  const factory StoresState({
    required bool isFetching,
    required String? selectedCategory,
    required List<Store> storeList,
    required bool notAvailable,
    required Option<StoreFailure> failure,
    required bool loadingMore,
  }) = _StoresState;
  factory StoresState.initial() => StoresState(
        isFetching: false,
        selectedCategory: null,
        storeList: [],
        notAvailable: false,
        failure: none(),
        loadingMore: false,
      );
}
