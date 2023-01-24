// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fyd_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FydUser _$$_FydUserFromJson(Map<String, dynamic> json) => _$_FydUser(
      uId: json['uId'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      addresses: (json['addresses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), FydAddress.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_FydUserToJson(_$_FydUser instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'phone': instance.phone,
      'name': instance.name,
      'email': instance.email,
      'addresses':
          instance.addresses.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };
