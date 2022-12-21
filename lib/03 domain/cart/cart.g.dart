// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      cartId: json['cartId'] as String,
      cartLimit: json['cartLimit'] as int,
      cartCount: json['cartCount'] as int,
      productsCollectionReference:
          json['productsCollectionReference'] as String,
      cartMap: (json['cartMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, int>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'cartId': instance.cartId,
      'cartLimit': instance.cartLimit,
      'cartCount': instance.cartCount,
      'productsCollectionReference': instance.productsCollectionReference,
      'cartMap': instance.cartMap,
    };
