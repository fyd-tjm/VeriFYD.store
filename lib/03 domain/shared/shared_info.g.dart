// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedInfo _$$_SharedInfoFromJson(Map<String, dynamic> json) =>
    _$_SharedInfo(
      categories: Map<String, String>.from(json['categories'] as Map),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      cartLimit: json['cartLimit'] as int,
      liveStores: Map<String, int>.from(json['liveStores'] as Map),
      timmings: Map<String, String>.from(json['timmings'] as Map),
      images: Map<String, String>.from(json['images'] as Map),
      support: Map<String, String>.from(json['support'] as Map),
      banners: (json['banners'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      offers: Map<String, String>.from(json['offers'] as Map),
    );

Map<String, dynamic> _$$_SharedInfoToJson(_$_SharedInfo instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'shippingCost': instance.shippingCost,
      'totalOrders': instance.totalOrders,
      'cartLimit': instance.cartLimit,
      'liveStores': instance.liveStores,
      'timmings': instance.timmings,
      'images': instance.images,
      'support': instance.support,
      'banners': instance.banners.map((k, e) => MapEntry(k.toString(), e)),
      'offers': instance.offers,
    };
