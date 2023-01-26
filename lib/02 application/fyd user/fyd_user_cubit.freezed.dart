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
      _$FydUserStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFetching,
      bool loadingState,
      bool isAuthenticated,
      FydUser? fydUser,
      List<FydOrder>? fydOrders,
      Option<Either<UserFailure, Unit>> failureOrSuccess,
      bool updating});

  $FydUserCopyWith<$Res>? get fydUser;
}

/// @nodoc
class _$FydUserStateCopyWithImpl<$Res> implements $FydUserStateCopyWith<$Res> {
  _$FydUserStateCopyWithImpl(this._value, this._then);

  final FydUserState _value;
  // ignore: unused_field
  final $Res Function(FydUserState) _then;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? loadingState = freezed,
    Object? isAuthenticated = freezed,
    Object? fydUser = freezed,
    Object? fydOrders = freezed,
    Object? failureOrSuccess = freezed,
    Object? updating = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: loadingState == freezed
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      fydUser: fydUser == freezed
          ? _value.fydUser
          : fydUser // ignore: cast_nullable_to_non_nullable
              as FydUser?,
      fydOrders: fydOrders == freezed
          ? _value.fydOrders
          : fydOrders // ignore: cast_nullable_to_non_nullable
              as List<FydOrder>?,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
      updating: updating == freezed
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FydUserCopyWith<$Res>? get fydUser {
    if (_value.fydUser == null) {
      return null;
    }

    return $FydUserCopyWith<$Res>(_value.fydUser!, (value) {
      return _then(_value.copyWith(fydUser: value));
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
  $Res call(
      {bool isFetching,
      bool loadingState,
      bool isAuthenticated,
      FydUser? fydUser,
      List<FydOrder>? fydOrders,
      Option<Either<UserFailure, Unit>> failureOrSuccess,
      bool updating});

  @override
  $FydUserCopyWith<$Res>? get fydUser;
}

/// @nodoc
class __$$_FydUserStateCopyWithImpl<$Res>
    extends _$FydUserStateCopyWithImpl<$Res>
    implements _$$_FydUserStateCopyWith<$Res> {
  __$$_FydUserStateCopyWithImpl(
      _$_FydUserState _value, $Res Function(_$_FydUserState) _then)
      : super(_value, (v) => _then(v as _$_FydUserState));

  @override
  _$_FydUserState get _value => super._value as _$_FydUserState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? loadingState = freezed,
    Object? isAuthenticated = freezed,
    Object? fydUser = freezed,
    Object? fydOrders = freezed,
    Object? failureOrSuccess = freezed,
    Object? updating = freezed,
  }) {
    return _then(_$_FydUserState(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingState: loadingState == freezed
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      fydUser: fydUser == freezed
          ? _value.fydUser
          : fydUser // ignore: cast_nullable_to_non_nullable
              as FydUser?,
      fydOrders: fydOrders == freezed
          ? _value._fydOrders
          : fydOrders // ignore: cast_nullable_to_non_nullable
              as List<FydOrder>?,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFailure, Unit>>,
      updating: updating == freezed
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
    return 'FydUserState(isFetching: $isFetching, loadingState: $loadingState, isAuthenticated: $isAuthenticated, fydUser: $fydUser, fydOrders: $fydOrders, failureOrSuccess: $failureOrSuccess, updating: $updating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydUserState &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality()
                .equals(other.loadingState, loadingState) &&
            const DeepCollectionEquality()
                .equals(other.isAuthenticated, isAuthenticated) &&
            const DeepCollectionEquality().equals(other.fydUser, fydUser) &&
            const DeepCollectionEquality()
                .equals(other._fydOrders, _fydOrders) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccess, failureOrSuccess) &&
            const DeepCollectionEquality().equals(other.updating, updating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(loadingState),
      const DeepCollectionEquality().hash(isAuthenticated),
      const DeepCollectionEquality().hash(fydUser),
      const DeepCollectionEquality().hash(_fydOrders),
      const DeepCollectionEquality().hash(failureOrSuccess),
      const DeepCollectionEquality().hash(updating));

  @JsonKey(ignore: true)
  @override
  _$$_FydUserStateCopyWith<_$_FydUserState> get copyWith =>
      __$$_FydUserStateCopyWithImpl<_$_FydUserState>(this, _$identity);
}

abstract class _FydUserState implements FydUserState {
  const factory _FydUserState(
      {required final bool isFetching,
      required final bool loadingState,
      required final bool isAuthenticated,
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
