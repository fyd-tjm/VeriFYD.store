// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShippingInfo _$$_ShippingInfoFromJson(Map<String, dynamic> json) =>
    _$_ShippingInfo(
      shippingAddress:
          FydAddress.fromJson(json['shippingAddress'] as Map<String, dynamic>),
      shippingCost: (json['shippingCost'] as num).toDouble(),
      trackingUrl: json['trackingUrl'] as String,
    );

Map<String, dynamic> _$$_ShippingInfoToJson(_$_ShippingInfo instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress.toJson(),
      'shippingCost': instance.shippingCost,
      'trackingUrl': instance.trackingUrl,
    };
