// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedInfo _$$_SharedInfoFromJson(Map<String, dynamic> json) =>
    _$_SharedInfo(
      categories: Map<String, String>.from(json['categories'] as Map),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      discount: Map<String, String>.from(json['discount'] as Map),
      banners: Map<String, String>.from(json['banners'] as Map),
      support: Map<String, String>.from(json['support'] as Map),
      liveStores: Map<String, int>.from(json['liveStores'] as Map),
      images: Map<String, String>.from(json['images'] as Map),
    );

Map<String, dynamic> _$$_SharedInfoToJson(_$_SharedInfo instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'shippingCost': instance.shippingCost,
      'discount': instance.discount,
      'banners': instance.banners,
      'support': instance.support,
      'liveStores': instance.liveStores,
      'images': instance.images,
    };
