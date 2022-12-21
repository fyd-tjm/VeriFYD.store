part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProductRealtime({
    required String productRef,
  }) = GetProductRealtime;
  const factory ProductEvent.recievedStreamEvent({
    required Either<ProductFailure, Product> event,
  }) = RecievedStreamEvent;
  const factory ProductEvent.toggleStates() = ToggleStates;
  const factory ProductEvent.addToCart({
    required String size,
  }) = AddToCart;
  const factory ProductEvent.addNewCartWithProduct({
    required String size,
  }) = AddNewCartWithProduct;
  const factory ProductEvent.addNewProduct({
    required String skuId,
    required String size,
  }) = AddNewProduct;
  const factory ProductEvent.addSameProduct({
    required String skuId,
    required String size,
  }) = AddSameProduct;
}
