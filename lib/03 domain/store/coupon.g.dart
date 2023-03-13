// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coupon _$$_CouponFromJson(Map<String, dynamic> json) => _$_Coupon(
      code: json['code'] as String,
      value: (json['value'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      isHidden: json['isHidden'] as bool,
      message: json['message'] as String,
      termsAndCondition: json['termsAndCondition'] as String,
      validTill:
          const TimestampConverter().fromJson(json['validTill'] as Timestamp),
      onOrderValue: (json['onOrderValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CouponToJson(_$_Coupon instance) => <String, dynamic>{
      'code': instance.code,
      'value': instance.value,
      'isActive': instance.isActive,
      'isHidden': instance.isHidden,
      'message': instance.message,
      'termsAndCondition': instance.termsAndCondition,
      'validTill': const TimestampConverter().toJson(instance.validTill),
      'onOrderValue': instance.onOrderValue,
    };
