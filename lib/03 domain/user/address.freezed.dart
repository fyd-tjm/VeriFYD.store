// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FydAddress _$FydAddressFromJson(Map<String, dynamic> json) {
  return _FydAddress.fromJson(json);
}

/// @nodoc
mixin _$FydAddress {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get line1 => throw _privateConstructorUsedError;
  String get line2 => throw _privateConstructorUsedError;
  String get landmark => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  int get pincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FydAddressCopyWith<FydAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FydAddressCopyWith<$Res> {
  factory $FydAddressCopyWith(
          FydAddress value, $Res Function(FydAddress) then) =
      _$FydAddressCopyWithImpl<$Res, FydAddress>;
  @useResult
  $Res call(
      {String name,
      String phone,
      String email,
      String line1,
      String line2,
      String landmark,
      String city,
      String state,
      int pincode});
}

/// @nodoc
class _$FydAddressCopyWithImpl<$Res, $Val extends FydAddress>
    implements $FydAddressCopyWith<$Res> {
  _$FydAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? line1 = null,
    Object? line2 = null,
    Object? landmark = null,
    Object? city = null,
    Object? state = null,
    Object? pincode = null,
  }) {
    return _then(_value.copyWith(
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
      line1: null == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String,
      line2: null == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FydAddressCopyWith<$Res>
    implements $FydAddressCopyWith<$Res> {
  factory _$$_FydAddressCopyWith(
          _$_FydAddress value, $Res Function(_$_FydAddress) then) =
      __$$_FydAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String email,
      String line1,
      String line2,
      String landmark,
      String city,
      String state,
      int pincode});
}

/// @nodoc
class __$$_FydAddressCopyWithImpl<$Res>
    extends _$FydAddressCopyWithImpl<$Res, _$_FydAddress>
    implements _$$_FydAddressCopyWith<$Res> {
  __$$_FydAddressCopyWithImpl(
      _$_FydAddress _value, $Res Function(_$_FydAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = null,
    Object? line1 = null,
    Object? line2 = null,
    Object? landmark = null,
    Object? city = null,
    Object? state = null,
    Object? pincode = null,
  }) {
    return _then(_$_FydAddress(
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
      line1: null == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String,
      line2: null == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FydAddress extends _FydAddress {
  const _$_FydAddress(
      {required this.name,
      required this.phone,
      required this.email,
      required this.line1,
      required this.line2,
      required this.landmark,
      required this.city,
      required this.state,
      required this.pincode})
      : super._();

  factory _$_FydAddress.fromJson(Map<String, dynamic> json) =>
      _$$_FydAddressFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String line1;
  @override
  final String line2;
  @override
  final String landmark;
  @override
  final String city;
  @override
  final String state;
  @override
  final int pincode;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydAddress &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.pincode, pincode) || other.pincode == pincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email, line1, line2,
      landmark, city, state, pincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FydAddressCopyWith<_$_FydAddress> get copyWith =>
      __$$_FydAddressCopyWithImpl<_$_FydAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FydAddressToJson(
      this,
    );
  }
}

abstract class _FydAddress extends FydAddress {
  const factory _FydAddress(
      {required final String name,
      required final String phone,
      required final String email,
      required final String line1,
      required final String line2,
      required final String landmark,
      required final String city,
      required final String state,
      required final int pincode}) = _$_FydAddress;
  const _FydAddress._() : super._();

  factory _FydAddress.fromJson(Map<String, dynamic> json) =
      _$_FydAddress.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  String get line1;
  @override
  String get line2;
  @override
  String get landmark;
  @override
  String get city;
  @override
  String get state;
  @override
  int get pincode;
  @override
  @JsonKey(ignore: true)
  _$$_FydAddressCopyWith<_$_FydAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
