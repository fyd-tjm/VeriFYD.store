// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fyd_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FydUserState {
  bool get isFetching => throw _privateConstructorUsedError;
  bool get loadingState => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get onBoardingStatus => throw _privateConstructorUsedError;
  FydUser? get fydUser => throw _privateConstructorUsedError;
  List<FydOrder>? get fydOrders => throw _privateConstructorUsedError;
  Option<Either<UserFailure, Unit>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get updating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FydUserStateCopyWith<FydUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FydUserStateCopyWith<$Res> {
  factory $FydUserStateCopyWith(
          FydUserState value, $Res Function(FydUserState) then) =
      _$FydUserStateCopyWithImpl<$Res, FydUserState>;
  @useResult
  $Res call(
      {bool isFetching,
      bool loadingState,
      bool isAuthenticated,
      bool onBoardingStatus,
      FydUser? fydUser,
      List<FydOrder>? fydOrders,
      Option<Either<UserFailure, Unit>> failureOrSuccess,
      bool updating});

  $FydUserCopyWith<$Res>? get fydUser;
}

/// @nodoc
class _$FydUserStateCopyWithImpl<$Res, $Val extends FydUserState>
    implements $FydUserStateCopyWith<$Res> {
  _$FydUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? loadingState = null,
    Object? isAuthenticated = null,
    Object? onBoardingStatus = null,
    Object? fydUser = freezed,
    Object? fydOrders = freezed,
    Object? failureOrSuccess = null,
    Object? updating = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      onBoardingStatus: null == onBoardingStatus
          ? _value.onBoardingStatus
          : onBoardingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      fydUser: freezed == fydUser
          ? _value.fydUser
          : fydUser // ignore: cast_nullable_to_non_nullable
              as FydUser?,
      fydOrders: freezed == fydOrders
          ? _value.fydOrders
          : fydOrders // ignore: cast_nullable_to_non_nullable
              as List<FydOrder>?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FydUserCopyWith<$Res>? get fydUser {
    if (_value.fydUser == null) {
      return null;
    }

    return $FydUserCopyWith<$Res>(_value.fydUser!, (value) {
      return _then(_value.copyWith(fydUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FydUserStateCopyWith<$Res>
    implements $FydUserStateCopyWith<$Res> {
  factory _$$_FydUserStateCopyWith(
          _$_FydUserState value, $Res Function(_$_FydUserState) then) =
      __$$_FydUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      bool loadingState,
      bool isAuthenticated,
      bool onBoardingStatus,
      FydUser? fydUser,
      List<FydOrder>? fydOrders,
      Option<Either<UserFailure, Unit>> failureOrSuccess,
      bool updating});

  @override
  $FydUserCopyWith<$Res>? get fydUser;
}

/// @nodoc
class __$$_FydUserStateCopyWithImpl<$Res>
    extends _$FydUserStateCopyWithImpl<$Res, _$_FydUserState>
    implements _$$_FydUserStateCopyWith<$Res> {
  __$$_FydUserStateCopyWithImpl(
      _$_FydUserState _value, $Res Function(_$_FydUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? loadingState = null,
    Object? isAuthenticated = null,
    Object? onBoardingStatus = null,
    Object? fydUser = freezed,
    Object? fydOrders = freezed,
    Object? failureOrSuccess = null,
    Object? updating = null,
  }) {
    return _then(_$_FydUserState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      onBoardingStatus: null == onBoardingStatus
          ? _value.onBoardingStatus
          : onBoardingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      fydUser: freezed == fydUser
          ? _value.fydUser
          : fydUser // ignore: cast_nullable_to_non_nullable
              as FydUser?,
      fydOrders: freezed == fydOrders
          ? _value._fydOrders
          : fydOrders // ignore: cast_nullable_to_non_nullable
              as List<FydOrder>?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FydUserState implements _FydUserState {
  const _$_FydUserState(
      {required this.isFetching,
      required this.loadingState,
      required this.isAuthenticated,
      required this.onBoardingStatus,
      required this.fydUser,
      required final List<FydOrder>? fydOrders,
      required this.failureOrSuccess,
      required this.updating})
      : _fydOrders = fydOrders;

  @override
  final bool isFetching;
  @override
  final bool loadingState;
  @override
  final bool isAuthenticated;
  @override
  final bool onBoardingStatus;
  @override
  final FydUser? fydUser;
  final List<FydOrder>? _fydOrders;
  @override
  List<FydOrder>? get fydOrders {
    final value = _fydOrders;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<UserFailure, Unit>> failureOrSuccess;
  @override
  final bool updating;

  @override
  String toString() {
    return 'FydUserState(isFetching: $isFetching, loadingState: $loadingState, isAuthenticated: $isAuthenticated, onBoardingStatus: $onBoardingStatus, fydUser: $fydUser, fydOrders: $fydOrders, failureOrSuccess: $failureOrSuccess, updating: $updating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydUserState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.onBoardingStatus, onBoardingStatus) ||
                other.onBoardingStatus == onBoardingStatus) &&
            (identical(other.fydUser, fydUser) || other.fydUser == fydUser) &&
            const DeepCollectionEquality()
                .equals(other._fydOrders, _fydOrders) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess) &&
            (identical(other.updating, updating) ||
                other.updating == updating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      loadingState,
      isAuthenticated,
      onBoardingStatus,
      fydUser,
      const DeepCollectionEquality().hash(_fydOrders),
      failureOrSuccess,
      updating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FydUserStateCopyWith<_$_FydUserState> get copyWith =>
      __$$_FydUserStateCopyWithImpl<_$_FydUserState>(this, _$identity);
}

abstract class _FydUserState implements FydUserState {
  const factory _FydUserState(
      {required final bool isFetching,
      required final bool loadingState,
      required final bool isAuthenticated,
      required final bool onBoardingStatus,
      required final FydUser? fydUser,
      required final List<FydOrder>? fydOrders,
      required final Option<Either<UserFailure, Unit>> failureOrSuccess,
      required final bool updating}) = _$_FydUserState;

  @override
  bool get isFetching;
  @override
  bool get loadingState;
  @override
  bool get isAuthenticated;
  @override
  bool get onBoardingStatus;
  @override
  FydUser? get fydUser;
  @override
  List<FydOrder>? get fydOrders;
  @override
  Option<Either<UserFailure, Unit>> get failureOrSuccess;
  @override
  bool get updating;
  @override
  @JsonKey(ignore: true)
  _$$_FydUserStateCopyWith<_$_FydUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
