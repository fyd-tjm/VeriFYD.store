// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fyd_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FydUser _$FydUserFromJson(Map<String, dynamic> json) {
  return _FydUser.fromJson(json);
}

/// @nodoc
mixin _$FydUser {
  String get uId => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Map<int, FydAddress> get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FydUserCopyWith<FydUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FydUserCopyWith<$Res> {
  factory $FydUserCopyWith(FydUser value, $Res Function(FydUser) then) =
      _$FydUserCopyWithImpl<$Res, FydUser>;
  @useResult
  $Res call(
      {String uId,
      String phone,
      String name,
      String email,
      Map<int, FydAddress> addresses});
}

/// @nodoc
class _$FydUserCopyWithImpl<$Res, $Val extends FydUser>
    implements $FydUserCopyWith<$Res> {
  _$FydUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
    Object? phone = null,
    Object? name = null,
    Object? email = null,
    Object? addresses = null,
  }) {
    return _then(_value.copyWith(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as Map<int, FydAddress>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FydUserCopyWith<$Res> implements $FydUserCopyWith<$Res> {
  factory _$$_FydUserCopyWith(
          _$_FydUser value, $Res Function(_$_FydUser) then) =
      __$$_FydUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uId,
      String phone,
      String name,
      String email,
      Map<int, FydAddress> addresses});
}

/// @nodoc
class __$$_FydUserCopyWithImpl<$Res>
    extends _$FydUserCopyWithImpl<$Res, _$_FydUser>
    implements _$$_FydUserCopyWith<$Res> {
  __$$_FydUserCopyWithImpl(_$_FydUser _value, $Res Function(_$_FydUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
    Object? phone = null,
    Object? name = null,
    Object? email = null,
    Object? addresses = null,
  }) {
    return _then(_$_FydUser(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as Map<int, FydAddress>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FydUser implements _FydUser {
  const _$_FydUser(
      {required this.uId,
      required this.phone,
      required this.name,
      required this.email,
      required final Map<int, FydAddress> addresses})
      : _addresses = addresses;

  factory _$_FydUser.fromJson(Map<String, dynamic> json) =>
      _$$_FydUserFromJson(json);

  @override
  final String uId;
  @override
  final String phone;
  @override
  final String name;
  @override
  final String email;
  final Map<int, FydAddress> _addresses;
  @override
  Map<int, FydAddress> get addresses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_addresses);
  }

  @override
  String toString() {
    return 'FydUser(uId: $uId, phone: $phone, name: $name, email: $email, addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydUser &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uId, phone, name, email,
      const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FydUserCopyWith<_$_FydUser> get copyWith =>
      __$$_FydUserCopyWithImpl<_$_FydUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FydUserToJson(
      this,
    );
  }
}

abstract class _FydUser implements FydUser {
  const factory _FydUser(
      {required final String uId,
      required final String phone,
      required final String name,
      required final String email,
      required final Map<int, FydAddress> addresses}) = _$_FydUser;

  factory _FydUser.fromJson(Map<String, dynamic> json) = _$_FydUser.fromJson;

  @override
  String get uId;
  @override
  String get phone;
  @override
  String get name;
  @override
  String get email;
  @override
  Map<int, FydAddress> get addresses;
  @override
  @JsonKey(ignore: true)
  _$$_FydUserCopyWith<_$_FydUser> get copyWith =>
      throw _privateConstructorUsedError;
}
