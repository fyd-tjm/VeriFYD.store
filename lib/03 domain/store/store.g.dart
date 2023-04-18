// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      storeId: json['storeId'] as String,
      name: json['name'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      types: Map<String, int>.from(json['types'] as Map),
      socialPresence: Map<String, String>.from(json['socialPresence'] as Map),
      featuredIn: (json['featuredIn'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      rating: (json['rating'] as num).toDouble(),
      about: json['about'] as String,
      storeLogo: json['storeLogo'] as String,
      storeAddress: (json['storeAddress'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      storeContact: (json['storeContact'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      isLive: json['isLive'] as bool,
      coupons: (json['coupons'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Coupon.fromJson(e as Map<String, dynamic>)),
      ),
      storeAlerts: (json['storeAlerts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'name': instance.name,
      'categories': instance.categories,
      'types': instance.types,
      'socialPresence': instance.socialPresence,
      'featuredIn':
          instance.featuredIn.map((k, e) => MapEntry(k.toString(), e)),
      'rating': instance.rating,
      'about': instance.about,
      'storeLogo': instance.storeLogo,
      'storeAddress':
          instance.storeAddress.map((k, e) => MapEntry(k.toString(), e)),
      'storeContact':
          instance.storeContact.map((k, e) => MapEntry(k.toString(), e)),
      'isLive': instance.isLive,
      'coupons': instance.coupons.map((k, e) => MapEntry(k, e.toJson())),
      'storeAlerts':
          instance.storeAlerts.map((k, e) => MapEntry(k.toString(), e)),
    };
