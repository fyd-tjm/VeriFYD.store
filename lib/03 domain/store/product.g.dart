// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      skuId: json['skuId'] as String,
      name: json['name'] as String,
      storeId: json['storeId'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      company: json['company'] as String,
      description: json['description'] as String,
      sizeAvailability: Map<String, int>.from(json['sizeAvailability'] as Map),
      sizeGuide: json['sizeGuide'] as String,
      qty: json['qty'] as int,
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      productImages: (json['productImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      productRef: json['productRef'] as String,
      popularity: json['popularity'] as int,
      inStock: json['inStock'] as bool,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'name': instance.name,
      'storeId': instance.storeId,
      'category': instance.category,
      'type': instance.type,
      'company': instance.company,
      'description': instance.description,
      'sizeAvailability': instance.sizeAvailability,
      'sizeGuide': instance.sizeGuide,
      'qty': instance.qty,
      'sellingPrice': instance.sellingPrice,
      'mrp': instance.mrp,
      'productImages': instance.productImages,
      'productRef': instance.productRef,
      'popularity': instance.popularity,
      'inStock': instance.inStock,
    };
