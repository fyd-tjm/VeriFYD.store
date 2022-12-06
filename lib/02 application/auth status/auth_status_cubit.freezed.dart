// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_status_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthStatusState {
  AuthUser? get authUser => throw _privateConstructorUsedError;
  bool get isInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStatusStateCopyWith<AuthStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusStateCopyWith<$Res> {
  factory $AuthStatusStateCopyWith(
          AuthStatusState value, $Res Function(AuthStatusState) then) =
      _$AuthStatusStateCopyWithImpl<$Res>;
  $Res call({AuthUser? authUser, bool isInProgress});

  $AuthUserCopyWith<$Res>? get authUser;
}

/// @nodoc
class _$AuthStatusStateCopyWithImpl<$Res>
    implements $AuthStatusStateCopyWith<$Res> {
  _$AuthStatusStateCopyWithImpl(this._value, this._then);

  final AuthStatusState _value;
  // ignore: unused_field
  final $Res Function(AuthStatusState) _then;

  @override
  $Res call({
    Object? authUser = freezed,
    Object? isInProgress = freezed,
  }) {
    return _then(_value.copyWith(
      authUser: authUser == freezed
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      isInProgress: isInProgress == freezed
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AuthUserCopyWith<$Res>? get authUser {
    if (_value.authUser == null) {
      return null;
    }

    return $AuthUserCopyWith<$Res>(_value.authUser!, (value) {
      return _then(_value.copyWith(authUser: value));
    });
  }
}

/// @nodoc
abstract class _$$_AuthStatusStateCopyWith<$Res>
    implements $AuthStatusStateCopyWith<$Res> {
  factory _$$_AuthStatusStateCopyWith(
          _$_AuthStatusState value, $Res Function(_$_AuthStatusState) then) =
      __$$_AuthStatusStateCopyWithImpl<$Res>;
  @override
  $Res call({AuthUser? authUser, bool isInProgress});

  @override
  $AuthUserCopyWith<$Res>? get authUser;
}

/// @nodoc
class __$$_AuthStatusStateCopyWithImpl<$Res>
    extends _$AuthStatusStateCopyWithImpl<$Res>
    implements _$$_AuthStatusStateCopyWith<$Res> {
  __$$_AuthStatusStateCopyWithImpl(
      _$_AuthStatusState _value, $Res Function(_$_AuthStatusState) _then)
      : super(_value, (v) => _then(v as _$_AuthStatusState));

  @override
  _$_AuthStatusState get _value => super._value as _$_AuthStatusState;

  @override
  $Res call({
    Object? authUser = freezed,
    Object? isInProgress = freezed,
  }) {
    return _then(_$_AuthStatusState(
      authUser: authUser == freezed
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
      isInProgress: isInProgress == freezed
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthStatusState extends _AuthStatusState {
  const _$_AuthStatusState({required this.authUser, required this.isInProgress})
      : super._();

  @override
  final AuthUser? authUser;
  @override
  final bool isInProgress;

  @override
  String toString() {
    return 'AuthStatusState(authUser: $authUser, isInProgress: $isInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStatusState &&
            const DeepCollectionEquality().equals(other.authUser, authUser) &&
            const DeepCollectionEquality()
                .equals(other.isInProgress, isInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authUser),
      const DeepCollectionEquality().hash(isInProgress));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStatusStateCopyWith<_$_AuthStatusState> get copyWith =>
      __$$_AuthStatusStateCopyWithImpl<_$_AuthStatusState>(this, _$identity);
}

abstract class _AuthStatusState extends AuthStatusState {
  const factory _AuthStatusState(
      {required final AuthUser? authUser,
      required final bool isInProgress}) = _$_AuthStatusState;
  const _AuthStatusState._() : super._();

  @override
  AuthUser? get authUser;
  @override
  bool get isInProgress;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStatusStateCopyWith<_$_AuthStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}
