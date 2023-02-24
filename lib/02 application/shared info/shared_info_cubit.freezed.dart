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
      _$SharedInfoStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFetching,
      SharedInfo? sharedInfo,
      Map<String, String> recentSearchMap,
      Option<SharedInfoFailure> failure});

  $SharedInfoCopyWith<$Res>? get sharedInfo;
}

/// @nodoc
class _$SharedInfoStateCopyWithImpl<$Res>
    implements $SharedInfoStateCopyWith<$Res> {
  _$SharedInfoStateCopyWithImpl(this._value, this._then);

  final SharedInfoState _value;
  // ignore: unused_field
  final $Res Function(SharedInfoState) _then;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? sharedInfo = freezed,
    Object? recentSearchMap = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedInfo: sharedInfo == freezed
          ? _value.sharedInfo
          : sharedInfo // ignore: cast_nullable_to_non_nullable
              as SharedInfo?,
      recentSearchMap: recentSearchMap == freezed
          ? _value.recentSearchMap
          : recentSearchMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<SharedInfoFailure>,
    ));
  }

  @override
  $SharedInfoCopyWith<$Res>? get sharedInfo {
    if (_value.sharedInfo == null) {
      return null;
    }

    return $SharedInfoCopyWith<$Res>(_value.sharedInfo!, (value) {
      return _then(_value.copyWith(sharedInfo: value));
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
    extends _$SharedInfoStateCopyWithImpl<$Res>
    implements _$$_SharedInfoStateCopyWith<$Res> {
  __$$_SharedInfoStateCopyWithImpl(
      _$_SharedInfoState _value, $Res Function(_$_SharedInfoState) _then)
      : super(_value, (v) => _then(v as _$_SharedInfoState));

  @override
  _$_SharedInfoState get _value => super._value as _$_SharedInfoState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? sharedInfo = freezed,
    Object? recentSearchMap = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_SharedInfoState(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedInfo: sharedInfo == freezed
          ? _value.sharedInfo
          : sharedInfo // ignore: cast_nullable_to_non_nullable
              as SharedInfo?,
      recentSearchMap: recentSearchMap == freezed
          ? _value._recentSearchMap
          : recentSearchMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      failure: failure == freezed
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
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality()
                .equals(other.sharedInfo, sharedInfo) &&
            const DeepCollectionEquality()
                .equals(other._recentSearchMap, _recentSearchMap) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(sharedInfo),
      const DeepCollectionEquality().hash(_recentSearchMap),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
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
