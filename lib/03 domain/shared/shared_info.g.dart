// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SharedInfo _$$_SharedInfoFromJson(Map<String, dynamic> json) =>
    _$_SharedInfo(
      shippingCost: (json['shippingCost'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      cartLimit: json['cartLimit'] as int,
      deliveryStates: (json['deliveryStates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      liveStores: Map<String, int>.from(json['liveStores'] as Map),
      timmings: Map<String, String>.from(json['timmings'] as Map),
      images: Map<String, String>.from(json['images'] as Map),
      support: Map<String, String>.from(json['support'] as Map),
      banners: Map<String, String>.from(json['banners'] as Map),
      offers: (json['offers'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Coupon.fromJson(e as Map<String, dynamic>)),
      ),
      storeSearchMap: Map<String, String>.from(json['storeSearchMap'] as Map),
      recentlyPurchased:
          (json['recentlyPurchased'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Product.fromJson(e as Map<String, dynamic>)),
      ),
      isPodAvailable: json['isPodAvailable'] as bool,
    );

Map<String, dynamic> _$$_SharedInfoToJson(_$_SharedInfo instance) =>
    <String, dynamic>{
      'shippingCost': instance.shippingCost,
      'totalOrders': instance.totalOrders,
      'cartLimit': instance.cartLimit,
      'deliveryStates': instance.deliveryStates,
      'liveStores': instance.liveStores,
      'timmings': instance.timmings,
      'images': instance.images,
      'support': instance.support,
      'banners': instance.banners,
      'offers': instance.offers.map((k, e) => MapEntry(k, e.toJson())),
      'storeSearchMap': instance.storeSearchMap,
      'recentlyPurchased':
          instance.recentlyPurchased.map((k, e) => MapEntry(k, e.toJson())),
      'isPodAvailable': instance.isPodAvailable,
    };
