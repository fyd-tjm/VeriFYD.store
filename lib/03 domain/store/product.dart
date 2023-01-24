import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@immutable
abstract class Product with _$Product {
  const factory Product({
    required String skuId,
    required String name,
    required String storeId,
    required String storeName,
    required String category,
    required String type,
    required String company,
    required String description,
    required Map<String, int> sizeAvailability,
    required String sizeGuide,
    required double sellingPrice,
    required double mrp,
    required List<String> productImages,
    required String thumbnailImage,
    required bool inStock,
    required int popularity,
    // required DateTime addedOn,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
