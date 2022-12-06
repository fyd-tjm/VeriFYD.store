// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'on_boarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnBoardingState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<UserFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnBoardingStateCopyWith<OnBoardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingStateCopyWith<$Res> {
  factory $OnBoardingStateCopyWith(
          OnBoardingState value, $Res Function(OnBoardingState) then) =
      _$OnBoardingStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      Option<Either<UserFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$OnBoardingStateCopyWithImpl<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  _$OnBoardingStateCopyWithImpl(this._value, this._then);

  final OnBoardingState _value;
  // ignore: unused_field
  final $Res Function(OnBoardingState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_OnBoardingStateCopyWith<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  factory _$$_OnBoardingStateCopyWith(
          _$_OnBoardingState value, $Res Function(_$_OnBoardingState) then) =
      __$$_OnBoardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      Option<Either<UserFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_OnBoardingStateCopyWithImpl<$Res>
    extends _$OnBoardingStateCopyWithImpl<$Res>
    implements _$$_OnBoardingStateCopyWith<$Res> {
  __$$_OnBoardingStateCopyWithImpl(
      _$_OnBoardingState _value, $Res Function(_$_OnBoardingState) _then)
      : super(_value, (v) => _then(v as _$_OnBoardingState));

  @override
  _$_OnBoardingState get _value => super._value as _$_OnBoardingState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_OnBoardingState(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_OnBoardingState extends _OnBoardingState {
  const _$_OnBoardingState(
      {required this.isSubmitting, required this.authFailureOrSuccessOption})
      : super._();

  @override
  final bool isSubmitting;
  @override
  final Option<Either<UserFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'OnBoardingState(isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnBoardingState &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_OnBoardingStateCopyWith<_$_OnBoardingState> get copyWith =>
      __$$_OnBoardingStateCopyWithImpl<_$_OnBoardingState>(this, _$identity);
}

abstract class _OnBoardingState extends OnBoardingState {
  const factory _OnBoardingState(
      {required final bool isSubmitting,
      required final Option<Either<UserFailure, Unit>>
          authFailureOrSuccessOption}) = _$_OnBoardingState;
  const _OnBoardingState._() : super._();

  @override
  bool get isSubmitting;
  @override
  Option<Either<UserFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_OnBoardingStateCopyWith<_$_OnBoardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
