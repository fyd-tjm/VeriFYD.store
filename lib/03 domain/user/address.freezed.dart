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
      _$FydAddressCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String phone,
      String email,
      String line1,
      String line2,
      String city,
      String state,
      int pincode});
}

/// @nodoc
class _$FydAddressCopyWithImpl<$Res> implements $FydAddressCopyWith<$Res> {
  _$FydAddressCopyWithImpl(this._value, this._then);

  final FydAddress _value;
  // ignore: unused_field
  final $Res Function(FydAddress) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_value.copyWith(
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
      line1: line1 == freezed
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String,
      line2: line2 == freezed
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: pincode == freezed
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_FydAddressCopyWith<$Res>
    implements $FydAddressCopyWith<$Res> {
  factory _$$_FydAddressCopyWith(
          _$_FydAddress value, $Res Function(_$_FydAddress) then) =
      __$$_FydAddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String phone,
      String email,
      String line1,
      String line2,
      String city,
      String state,
      int pincode});
}

/// @nodoc
class __$$_FydAddressCopyWithImpl<$Res> extends _$FydAddressCopyWithImpl<$Res>
    implements _$$_FydAddressCopyWith<$Res> {
  __$$_FydAddressCopyWithImpl(
      _$_FydAddress _value, $Res Function(_$_FydAddress) _then)
      : super(_value, (v) => _then(v as _$_FydAddress));

  @override
  _$_FydAddress get _value => super._value as _$_FydAddress;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
  }) {
    return _then(_$_FydAddress(
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
      line1: line1 == freezed
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String,
      line2: line2 == freezed
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: pincode == freezed
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
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.line1, line1) &&
            const DeepCollectionEquality().equals(other.line2, line2) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.pincode, pincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(line1),
      const DeepCollectionEquality().hash(line2),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(pincode));

  @JsonKey(ignore: true)
  @override
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
