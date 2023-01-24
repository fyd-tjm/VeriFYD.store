// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentInfo _$$_PaymentInfoFromJson(Map<String, dynamic> json) =>
    _$_PaymentInfo(
      paymentAmount: (json['paymentAmount'] as num).toDouble(),
      paymentMode:
          PaymentMode.fromJson(json['paymentMode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaymentInfoToJson(_$_PaymentInfo instance) =>
    <String, dynamic>{
      'paymentAmount': instance.paymentAmount,
      'paymentMode': instance.paymentMode.toJson(),
    };

_$Online _$$OnlineFromJson(Map<String, dynamic> json) => _$Online(
      paymentId: json['paymentId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OnlineToJson(_$Online instance) => <String, dynamic>{
      'paymentId': instance.paymentId,
      'runtimeType': instance.$type,
    };

_$PayOnDelivery _$$PayOnDeliveryFromJson(Map<String, dynamic> json) =>
    _$PayOnDelivery(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PayOnDeliveryToJson(_$PayOnDelivery instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
