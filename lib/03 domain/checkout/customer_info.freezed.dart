// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) {
  return _CustomerInfo.fromJson(json);
}

/// @nodoc
mixin _$CustomerInfo {
  String get customerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInfoCopyWith<CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInfoCopyWith<$Res> {
  factory $CustomerInfoCopyWith(
          CustomerInfo value, $Res Function(CustomerInfo) then) =
      _$CustomerInfoCopyWithImpl<$Res>;
  $Res call({String customerId, String name, String phone, String email});
}

/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res> implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._value, this._then);

  final CustomerInfo _value;
  // ignore: unused_field
  final $Res Function(CustomerInfo) _then;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerInfoCopyWith<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  factory _$$_CustomerInfoCopyWith(
          _$_CustomerInfo value, $Res Function(_$_CustomerInfo) then) =
      __$$_CustomerInfoCopyWithImpl<$Res>;
  @override
  $Res call({String customerId, String name, String phone, String email});
}

/// @nodoc
class __$$_CustomerInfoCopyWithImpl<$Res>
    extends _$CustomerInfoCopyWithImpl<$Res>
    implements _$$_CustomerInfoCopyWith<$Res> {
  __$$_CustomerInfoCopyWithImpl(
      _$_CustomerInfo _value, $Res Function(_$_CustomerInfo) _then)
      : super(_value, (v) => _then(v as _$_CustomerInfo));

  @override
  _$_CustomerInfo get _value => super._value as _$_CustomerInfo;

  @override
  $Res call({
    Object? customerId = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_CustomerInfo(
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerInfo implements _CustomerInfo {
  const _$_CustomerInfo(
      {required this.customerId,
      required this.name,
      required this.phone,
      required this.email});

  factory _$_CustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerInfoFromJson(json);

  @override
  final String customerId;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'CustomerInfo(customerId: $customerId, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerInfo &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customerId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerInfoCopyWith<_$_CustomerInfo> get copyWith =>
      __$$_CustomerInfoCopyWithImpl<_$_CustomerInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerInfoToJson(
      this,
    );
  }
}

abstract class _CustomerInfo implements CustomerInfo {
  const factory _CustomerInfo(
      {required final String customerId,
      required final String name,
      required final String phone,
      required final String email}) = _$_CustomerInfo;

  factory _CustomerInfo.fromJson(Map<String, dynamic> json) =
      _$_CustomerInfo.fromJson;

  @override
  String get customerId;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerInfoCopyWith<_$_CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
