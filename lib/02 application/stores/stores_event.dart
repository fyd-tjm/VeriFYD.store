part of 'stores_bloc.dart';

@freezed
class StoresEvent with _$StoresEvent {
  const factory StoresEvent.updateSelectedCategory({required String category}) =
      UpdateSelectedCategory;
  const factory StoresEvent.loadMoreStores() = LoadMoreStores;
  const factory StoresEvent.fetchStores(
      {required String category, String? fetchAfterSid}) = FetchStores;
  const factory StoresEvent.toggleFailures() = ToggleFailures;
}
