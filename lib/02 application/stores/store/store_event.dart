part of 'store_bloc.dart';

@freezed
class StoreEvent with _$StoreEvent {
  const factory StoreEvent.getStoreRealtime({required String storeId}) =
      GetStoreRealtime;
  const factory StoreEvent.recievedStreamEvent(
      {required Either<StoreFailure, Store> event}) = RecievedStreamEvent;
  const factory StoreEvent.updateSelectedType({required String type}) =
      UpdateSelectedType;
  const factory StoreEvent.loadMoreProducts() = LoadMoreProducts;
}
