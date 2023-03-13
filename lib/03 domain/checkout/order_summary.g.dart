// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderSummary _$$_OrderSummaryFromJson(Map<String, dynamic> json) =>
    _$_OrderSummary(
      totalItems: json['totalItems'] as int,
      subTotal: (json['subTotal'] as num).toDouble(),
      discount: json['discount'] == null
          ? null
          : Coupon.fromJson(json['discount'] as Map<String, dynamic>),
      shippingCost: (json['shippingCost'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderSummaryToJson(_$_OrderSummary instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'subTotal': instance.subTotal,
      'discount': instance.discount?.toJson(),
      'shippingCost': instance.shippingCost,
      'total': instance.total,
    };
