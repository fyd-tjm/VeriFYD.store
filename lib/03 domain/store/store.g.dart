// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      sId: json['sId'] as String,
      name: json['name'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      types: Map<String, int>.from(json['types'] as Map),
      socialPresence: Map<String, String>.from(json['socialPresence'] as Map),
      rating: (json['rating'] as num).toDouble(),
      about: json['about'] as String,
      storeImages: (json['storeImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      storeLogo: json['storeLogo'] as String,
      storeAddress: Map<String, String>.from(json['storeAddress'] as Map),
      storeContact: Map<String, String>.from(json['storeContact'] as Map),
      productsRef: json['productsRef'] as String,
      isLive: json['isLive'] as bool,
      docId: json['docId'] as String,
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'categories': instance.categories,
      'types': instance.types,
      'socialPresence': instance.socialPresence,
      'rating': instance.rating,
      'about': instance.about,
      'storeImages': instance.storeImages,
      'storeLogo': instance.storeLogo,
      'storeAddress': instance.storeAddress,
      'storeContact': instance.storeContact,
      'productsRef': instance.productsRef,
      'isLive': instance.isLive,
      'docId': instance.docId,
    };
