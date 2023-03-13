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
      _$CustomerInfoCopyWithImpl<$Res, CustomerInfo>;
  @useResult
  $Res call({String customerId, String name, String phone, String email});
}

/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res, $Val extends CustomerInfo>
    implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerInfoCopyWith<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  factory _$$_CustomerInfoCopyWith(
          _$_CustomerInfo value, $Res Function(_$_CustomerInfo) then) =
      __$$_CustomerInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerId, String name, String phone, String email});
}

/// @nodoc
class __$$_CustomerInfoCopyWithImpl<$Res>
    extends _$CustomerInfoCopyWithImpl<$Res, _$_CustomerInfo>
    implements _$$_CustomerInfoCopyWith<$Res> {
  __$$_CustomerInfoCopyWithImpl(
      _$_CustomerInfo _value, $Res Function(_$_CustomerInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? name = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$_CustomerInfo(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
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
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, name, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
