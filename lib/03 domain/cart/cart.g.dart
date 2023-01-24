// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      cartId: json['cartId'] as String,
      storeName: json['storeName'] as String,
      cartCount: json['cartCount'] as int,
      cartItems: (json['cartItems'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, int>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'cartId': instance.cartId,
      'storeName': instance.storeName,
      'cartCount': instance.cartCount,
      'cartItems': instance.cartItems,
    };

_$_CartSummary _$$_CartSummaryFromJson(Map<String, dynamic> json) =>
    _$_CartSummary(
      totalItems: json['totalItems'] as int,
      subTotal: (json['subTotal'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CartSummaryToJson(_$_CartSummary instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'subTotal': instance.subTotal,
    };
