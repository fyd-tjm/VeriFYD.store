// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidPhoneLength,
    required TResult Function(T failedValue) invalidOtpLength,
    required TResult Function(T failedValue) invalidUserName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidPhoneLength<T> value) invalidPhoneLength,
    required TResult Function(InvalidOtpLength<T> value) invalidOtpLength,
    required TResult Function(InvalidUserName<T> value) invalidUserName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$$InvalidPhoneLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidPhoneLengthCopyWith(_$InvalidPhoneLength<T> value,
          $Res Function(_$InvalidPhoneLength<T>) then) =
      __$$InvalidPhoneLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidPhoneLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidPhoneLengthCopyWith<T, $Res> {
  __$$InvalidPhoneLengthCopyWithImpl(_$InvalidPhoneLength<T> _value,
      $Res Function(_$InvalidPhoneLength<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidPhoneLength<T>));

  @override
  _$InvalidPhoneLength<T> get _value => super._value as _$InvalidPhoneLength<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidPhoneLength<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidPhoneLength<T> implements InvalidPhoneLength<T> {
  const _$InvalidPhoneLength({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPhoneLength(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPhoneLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidPhoneLengthCopyWith<T, _$InvalidPhoneLength<T>> get copyWith =>
      __$$InvalidPhoneLengthCopyWithImpl<T, _$InvalidPhoneLength<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidPhoneLength,
    required TResult Function(T failedValue) invalidOtpLength,
    required TResult Function(T failedValue) invalidUserName,
  }) {
    return invalidPhoneLength(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
  }) {
    return invalidPhoneLength?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidPhoneLength != null) {
      return invalidPhoneLength(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidPhoneLength<T> value) invalidPhoneLength,
    required TResult Function(InvalidOtpLength<T> value) invalidOtpLength,
    required TResult Function(InvalidUserName<T> value) invalidUserName,
  }) {
    return invalidPhoneLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
  }) {
    return invalidPhoneLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidPhoneLength != null) {
      return invalidPhoneLength(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneLength<T> implements ValueFailure<T> {
  const factory InvalidPhoneLength({required final T failedValue}) =
      _$InvalidPhoneLength<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPhoneLengthCopyWith<T, _$InvalidPhoneLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidOtpLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidOtpLengthCopyWith(_$InvalidOtpLength<T> value,
          $Res Function(_$InvalidOtpLength<T>) then) =
      __$$InvalidOtpLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidOtpLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidOtpLengthCopyWith<T, $Res> {
  __$$InvalidOtpLengthCopyWithImpl(
      _$InvalidOtpLength<T> _value, $Res Function(_$InvalidOtpLength<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidOtpLength<T>));

  @override
  _$InvalidOtpLength<T> get _value => super._value as _$InvalidOtpLength<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidOtpLength<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidOtpLength<T> implements InvalidOtpLength<T> {
  const _$InvalidOtpLength({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidOtpLength(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidOtpLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidOtpLengthCopyWith<T, _$InvalidOtpLength<T>> get copyWith =>
      __$$InvalidOtpLengthCopyWithImpl<T, _$InvalidOtpLength<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidPhoneLength,
    required TResult Function(T failedValue) invalidOtpLength,
    required TResult Function(T failedValue) invalidUserName,
  }) {
    return invalidOtpLength(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
  }) {
    return invalidOtpLength?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidOtpLength != null) {
      return invalidOtpLength(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidPhoneLength<T> value) invalidPhoneLength,
    required TResult Function(InvalidOtpLength<T> value) invalidOtpLength,
    required TResult Function(InvalidUserName<T> value) invalidUserName,
  }) {
    return invalidOtpLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
  }) {
    return invalidOtpLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidOtpLength != null) {
      return invalidOtpLength(this);
    }
    return orElse();
  }
}

abstract class InvalidOtpLength<T> implements ValueFailure<T> {
  const factory InvalidOtpLength({required final T failedValue}) =
      _$InvalidOtpLength<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidOtpLengthCopyWith<T, _$InvalidOtpLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidUserNameCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidUserNameCopyWith(_$InvalidUserName<T> value,
          $Res Function(_$InvalidUserName<T>) then) =
      __$$InvalidUserNameCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidUserNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidUserNameCopyWith<T, $Res> {
  __$$InvalidUserNameCopyWithImpl(
      _$InvalidUserName<T> _value, $Res Function(_$InvalidUserName<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidUserName<T>));

  @override
  _$InvalidUserName<T> get _value => super._value as _$InvalidUserName<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidUserName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidUserName<T> implements InvalidUserName<T> {
  const _$InvalidUserName({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUserName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidUserName<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidUserNameCopyWith<T, _$InvalidUserName<T>> get copyWith =>
      __$$InvalidUserNameCopyWithImpl<T, _$InvalidUserName<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidPhoneLength,
    required TResult Function(T failedValue) invalidOtpLength,
    required TResult Function(T failedValue) invalidUserName,
  }) {
    return invalidUserName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
  }) {
    return invalidUserName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidPhoneLength,
    TResult Function(T failedValue)? invalidOtpLength,
    TResult Function(T failedValue)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidPhoneLength<T> value) invalidPhoneLength,
    required TResult Function(InvalidOtpLength<T> value) invalidOtpLength,
    required TResult Function(InvalidUserName<T> value) invalidUserName,
  }) {
    return invalidUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
  }) {
    return invalidUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidPhoneLength<T> value)? invalidPhoneLength,
    TResult Function(InvalidOtpLength<T> value)? invalidOtpLength,
    TResult Function(InvalidUserName<T> value)? invalidUserName,
    required TResult orElse(),
  }) {
    if (invalidUserName != null) {
      return invalidUserName(this);
    }
    return orElse();
  }
}

abstract class InvalidUserName<T> implements ValueFailure<T> {
  const factory InvalidUserName({required final T failedValue}) =
      _$InvalidUserName<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidUserNameCopyWith<T, _$InvalidUserName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
