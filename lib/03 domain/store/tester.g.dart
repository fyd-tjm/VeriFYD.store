// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tester _$$_TesterFromJson(Map<String, dynamic> json) => _$_Tester(
      index: json['index'] as int,
      coupons: (json['coupons'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Coupon.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_TesterToJson(_$_Tester instance) => <String, dynamic>{
      'index': instance.index,
      'coupons': instance.coupons.map((k, e) => MapEntry(k, e.toJson())),
    };
