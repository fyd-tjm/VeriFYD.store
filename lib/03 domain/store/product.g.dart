// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      skuId: json['skuId'] as String,
      name: json['name'] as String,
      storeId: json['storeId'] as String,
      storeName: json['storeName'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      company: json['company'] as String,
      description: json['description'] as String,
      policy: json['policy'] as String,
      sizeAvailability: Map<String, int>.from(json['sizeAvailability'] as Map),
      sizeGuide: json['sizeGuide'] as String,
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      mrp: (json['mrp'] as num).toDouble(),
      productImages: (json['productImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      thumbnailImage: json['thumbnailImage'] as String,
      inStock: json['inStock'] as bool,
      popularity: json['popularity'] as int,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'name': instance.name,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'category': instance.category,
      'type': instance.type,
      'company': instance.company,
      'description': instance.description,
      'policy': instance.policy,
      'sizeAvailability': instance.sizeAvailability,
      'sizeGuide': instance.sizeGuide,
      'sellingPrice': instance.sellingPrice,
      'mrp': instance.mrp,
      'productImages': instance.productImages,
      'thumbnailImage': instance.thumbnailImage,
      'inStock': instance.inStock,
      'popularity': instance.popularity,
    };
