// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_Info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderInfo _$$_OrderInfoFromJson(Map<String, dynamic> json) => _$_OrderInfo(
      storeId: json['storeId'] as String,
      storeName: json['storeName'] as String,
      orderItems: (json['orderItems'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, int>.from(e as Map)),
      ),
      orderItemsDetail: (json['orderItemsDetail'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Product.fromJson(e as Map<String, dynamic>)),
      ),
      orderSummary:
          OrderSummary.fromJson(json['orderSummary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderInfoToJson(_$_OrderInfo instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'orderItems': instance.orderItems,
      'orderItemsDetail':
          instance.orderItemsDetail.map((k, e) => MapEntry(k, e.toJson())),
      'orderSummary': instance.orderSummary.toJson(),
    };
