// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FydAddress _$$_FydAddressFromJson(Map<String, dynamic> json) =>
    _$_FydAddress(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      line1: json['line1'] as String,
      line2: json['line2'] as String,
      landmark: json['landmark'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as int,
    );

Map<String, dynamic> _$$_FydAddressToJson(_$_FydAddress instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'line1': instance.line1,
      'line2': instance.line2,
      'landmark': instance.landmark,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
    };
