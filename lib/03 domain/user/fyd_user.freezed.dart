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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FydUserCopyWith<FydUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FydUserCopyWith<$Res> {
  factory $FydUserCopyWith(FydUser value, $Res Function(FydUser) then) =
      _$FydUserCopyWithImpl<$Res>;
  $Res call({String uId, String phone, String name});
}

/// @nodoc
class _$FydUserCopyWithImpl<$Res> implements $FydUserCopyWith<$Res> {
  _$FydUserCopyWithImpl(this._value, this._then);

  final FydUser _value;
  // ignore: unused_field
  final $Res Function(FydUser) _then;

  @override
  $Res call({
    Object? uId = freezed,
    Object? phone = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      uId: uId == freezed
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FydUserCopyWith<$Res> implements $FydUserCopyWith<$Res> {
  factory _$$_FydUserCopyWith(
          _$_FydUser value, $Res Function(_$_FydUser) then) =
      __$$_FydUserCopyWithImpl<$Res>;
  @override
  $Res call({String uId, String phone, String name});
}

/// @nodoc
class __$$_FydUserCopyWithImpl<$Res> extends _$FydUserCopyWithImpl<$Res>
    implements _$$_FydUserCopyWith<$Res> {
  __$$_FydUserCopyWithImpl(_$_FydUser _value, $Res Function(_$_FydUser) _then)
      : super(_value, (v) => _then(v as _$_FydUser));

  @override
  _$_FydUser get _value => super._value as _$_FydUser;

  @override
  $Res call({
    Object? uId = freezed,
    Object? phone = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_FydUser(
      uId: uId == freezed
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FydUser implements _FydUser {
  const _$_FydUser(
      {required this.uId, required this.phone, required this.name});

  factory _$_FydUser.fromJson(Map<String, dynamic> json) =>
      _$$_FydUserFromJson(json);

  @override
  final String uId;
  @override
  final String phone;
  @override
  final String name;

  @override
  String toString() {
    return 'FydUser(uId: $uId, phone: $phone, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydUser &&
            const DeepCollectionEquality().equals(other.uId, uId) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uId),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
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
      required final String name}) = _$_FydUser;

  factory _FydUser.fromJson(Map<String, dynamic> json) = _$_FydUser.fromJson;

  @override
  String get uId;
  @override
  String get phone;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FydUserCopyWith<_$_FydUser> get copyWith =>
      throw _privateConstructorUsedError;
}
