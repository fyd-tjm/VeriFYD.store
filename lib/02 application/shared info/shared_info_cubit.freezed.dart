// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shared_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SharedInfoState {
  bool get isFetching => throw _privateConstructorUsedError;
  SharedInfo? get sharedInfo => throw _privateConstructorUsedError;
  Map<String, String> get recentSearchMap => throw _privateConstructorUsedError;
  Option<SharedInfoFailure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SharedInfoStateCopyWith<SharedInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedInfoStateCopyWith<$Res> {
  factory $SharedInfoStateCopyWith(
          SharedInfoState value, $Res Function(SharedInfoState) then) =
      _$SharedInfoStateCopyWithImpl<$Res, SharedInfoState>;
  @useResult
  $Res call(
      {bool isFetching,
      SharedInfo? sharedInfo,
      Map<String, String> recentSearchMap,
      Option<SharedInfoFailure> failure});

  $SharedInfoCopyWith<$Res>? get sharedInfo;
}

/// @nodoc
class _$SharedInfoStateCopyWithImpl<$Res, $Val extends SharedInfoState>
    implements $SharedInfoStateCopyWith<$Res> {
  _$SharedInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? sharedInfo = freezed,
    Object? recentSearchMap = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedInfo: freezed == sharedInfo
          ? _value.sharedInfo
          : sharedInfo // ignore: cast_nullable_to_non_nullable
              as SharedInfo?,
      recentSearchMap: null == recentSearchMap
          ? _value.recentSearchMap
          : recentSearchMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<SharedInfoFailure>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SharedInfoCopyWith<$Res>? get sharedInfo {
    if (_value.sharedInfo == null) {
      return null;
    }

    return $SharedInfoCopyWith<$Res>(_value.sharedInfo!, (value) {
      return _then(_value.copyWith(sharedInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SharedInfoStateCopyWith<$Res>
    implements $SharedInfoStateCopyWith<$Res> {
  factory _$$_SharedInfoStateCopyWith(
          _$_SharedInfoState value, $Res Function(_$_SharedInfoState) then) =
      __$$_SharedInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      SharedInfo? sharedInfo,
      Map<String, String> recentSearchMap,
      Option<SharedInfoFailure> failure});

  @override
  $SharedInfoCopyWith<$Res>? get sharedInfo;
}

/// @nodoc
class __$$_SharedInfoStateCopyWithImpl<$Res>
    extends _$SharedInfoStateCopyWithImpl<$Res, _$_SharedInfoState>
    implements _$$_SharedInfoStateCopyWith<$Res> {
  __$$_SharedInfoStateCopyWithImpl(
      _$_SharedInfoState _value, $Res Function(_$_SharedInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? sharedInfo = freezed,
    Object? recentSearchMap = null,
    Object? failure = null,
  }) {
    return _then(_$_SharedInfoState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedInfo: freezed == sharedInfo
          ? _value.sharedInfo
          : sharedInfo // ignore: cast_nullable_to_non_nullable
              as SharedInfo?,
      recentSearchMap: null == recentSearchMap
          ? _value._recentSearchMap
          : recentSearchMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<SharedInfoFailure>,
    ));
  }
}

/// @nodoc

class _$_SharedInfoState extends _SharedInfoState {
  const _$_SharedInfoState(
      {required this.isFetching,
      required this.sharedInfo,
      required final Map<String, String> recentSearchMap,
      required this.failure})
      : _recentSearchMap = recentSearchMap,
        super._();

  @override
  final bool isFetching;
  @override
  final SharedInfo? sharedInfo;
  final Map<String, String> _recentSearchMap;
  @override
  Map<String, String> get recentSearchMap {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_recentSearchMap);
  }

  @override
  final Option<SharedInfoFailure> failure;

  @override
  String toString() {
    return 'SharedInfoState(isFetching: $isFetching, sharedInfo: $sharedInfo, recentSearchMap: $recentSearchMap, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedInfoState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.sharedInfo, sharedInfo) ||
                other.sharedInfo == sharedInfo) &&
            const DeepCollectionEquality()
                .equals(other._recentSearchMap, _recentSearchMap) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching, sharedInfo,
      const DeepCollectionEquality().hash(_recentSearchMap), failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SharedInfoStateCopyWith<_$_SharedInfoState> get copyWith =>
      __$$_SharedInfoStateCopyWithImpl<_$_SharedInfoState>(this, _$identity);
}

abstract class _SharedInfoState extends SharedInfoState {
  const factory _SharedInfoState(
      {required final bool isFetching,
      required final SharedInfo? sharedInfo,
      required final Map<String, String> recentSearchMap,
      required final Option<SharedInfoFailure> failure}) = _$_SharedInfoState;
  const _SharedInfoState._() : super._();

  @override
  bool get isFetching;
  @override
  SharedInfo? get sharedInfo;
  @override
  Map<String, String> get recentSearchMap;
  @override
  Option<SharedInfoFailure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$_SharedInfoStateCopyWith<_$_SharedInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
