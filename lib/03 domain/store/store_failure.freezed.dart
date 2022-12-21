// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoreFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() notFound,
    required TResult Function() serverError,
    required TResult Function() unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(NotFound value) notFound,
    required TResult Function(ServerError value) serverError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreFailureCopyWith<$Res> {
  factory $StoreFailureCopyWith(
          StoreFailure value, $Res Function(StoreFailure) then) =
      _$StoreFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoreFailureCopyWithImpl<$Res> implements $StoreFailureCopyWith<$Res> {
  _$StoreFailureCopyWithImpl(this._value, this._then);

  final StoreFailure _value;
  // ignore: unused_field
  final $Res Function(StoreFailure) _then;
}

/// @nodoc
abstract class _$$PermissionDeniedCopyWith<$Res> {
  factory _$$PermissionDeniedCopyWith(
          _$PermissionDenied value, $Res Function(_$PermissionDenied) then) =
      __$$PermissionDeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PermissionDeniedCopyWithImpl<$Res>
    extends _$StoreFailureCopyWithImpl<$Res>
    implements _$$PermissionDeniedCopyWith<$Res> {
  __$$PermissionDeniedCopyWithImpl(
      _$PermissionDenied _value, $Res Function(_$PermissionDenied) _then)
      : super(_value, (v) => _then(v as _$PermissionDenied));

  @override
  _$PermissionDenied get _value => super._value as _$PermissionDenied;
}

/// @nodoc

class _$PermissionDenied implements PermissionDenied {
  const _$PermissionDenied();

  @override
  String toString() {
    return 'StoreFailure.permissionDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PermissionDenied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() notFound,
    required TResult Function() serverError,
    required TResult Function() unexpectedError,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(NotFound value) notFound,
    required TResult Function(ServerError value) serverError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class PermissionDenied implements StoreFailure {
  const factory PermissionDenied() = _$PermissionDenied;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<$Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound value, $Res Function(_$NotFound) then) =
      __$$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$$NotFoundCopyWith<$Res> {
  __$$NotFoundCopyWithImpl(_$NotFound _value, $Res Function(_$NotFound) _then)
      : super(_value, (v) => _then(v as _$NotFound));

  @override
  _$NotFound get _value => super._value as _$NotFound;
}

/// @nodoc

class _$NotFound implements NotFound {
  const _$NotFound();

  @override
  String toString() {
    return 'StoreFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() notFound,
    required TResult Function() serverError,
    required TResult Function() unexpectedError,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(NotFound value) notFound,
    required TResult Function(ServerError value) serverError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements StoreFailure {
  const factory NotFound() = _$NotFound;
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError value, $Res Function(_$ServerError) then) =
      __$$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$$ServerErrorCopyWith<$Res> {
  __$$ServerErrorCopyWithImpl(
      _$ServerError _value, $Res Function(_$ServerError) _then)
      : super(_value, (v) => _then(v as _$ServerError));

  @override
  _$ServerError get _value => super._value as _$ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'StoreFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() notFound,
    required TResult Function() serverError,
    required TResult Function() unexpectedError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(NotFound value) notFound,
    required TResult Function(ServerError value) serverError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements StoreFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class _$$UnexpectedErrorCopyWith<$Res> {
  factory _$$UnexpectedErrorCopyWith(
          _$UnexpectedError value, $Res Function(_$UnexpectedError) then) =
      __$$UnexpectedErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedErrorCopyWithImpl<$Res>
    extends _$StoreFailureCopyWithImpl<$Res>
    implements _$$UnexpectedErrorCopyWith<$Res> {
  __$$UnexpectedErrorCopyWithImpl(
      _$UnexpectedError _value, $Res Function(_$UnexpectedError) _then)
      : super(_value, (v) => _then(v as _$UnexpectedError));

  @override
  _$UnexpectedError get _value => super._value as _$UnexpectedError;
}

/// @nodoc

class _$UnexpectedError implements UnexpectedError {
  const _$UnexpectedError();

  @override
  String toString() {
    return 'StoreFailure.unexpectedError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() notFound,
    required TResult Function() serverError,
    required TResult Function() unexpectedError,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
  }) {
    return unexpectedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? notFound,
    TResult Function()? serverError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(NotFound value) notFound,
    required TResult Function(ServerError value) serverError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(NotFound value)? notFound,
    TResult Function(ServerError value)? serverError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError implements StoreFailure {
  const factory UnexpectedError() = _$UnexpectedError;
}
