// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tester.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tester _$TesterFromJson(Map<String, dynamic> json) {
  return _Tester.fromJson(json);
}

/// @nodoc
mixin _$Tester {
  int get index => throw _privateConstructorUsedError;
  Map<String, Coupon> get coupons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TesterCopyWith<Tester> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TesterCopyWith<$Res> {
  factory $TesterCopyWith(Tester value, $Res Function(Tester) then) =
      _$TesterCopyWithImpl<$Res, Tester>;
  @useResult
  $Res call({int index, Map<String, Coupon> coupons});
}

/// @nodoc
class _$TesterCopyWithImpl<$Res, $Val extends Tester>
    implements $TesterCopyWith<$Res> {
  _$TesterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? coupons = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      coupons: null == coupons
          ? _value.coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TesterCopyWith<$Res> implements $TesterCopyWith<$Res> {
  factory _$$_TesterCopyWith(_$_Tester value, $Res Function(_$_Tester) then) =
      __$$_TesterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, Map<String, Coupon> coupons});
}

/// @nodoc
class __$$_TesterCopyWithImpl<$Res>
    extends _$TesterCopyWithImpl<$Res, _$_Tester>
    implements _$$_TesterCopyWith<$Res> {
  __$$_TesterCopyWithImpl(_$_Tester _value, $Res Function(_$_Tester) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? coupons = null,
  }) {
    return _then(_$_Tester(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      coupons: null == coupons
          ? _value._coupons
          : coupons // ignore: cast_nullable_to_non_nullable
              as Map<String, Coupon>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Tester implements _Tester {
  const _$_Tester(
      {required this.index, required final Map<String, Coupon> coupons})
      : _coupons = coupons;

  factory _$_Tester.fromJson(Map<String, dynamic> json) =>
      _$$_TesterFromJson(json);

  @override
  final int index;
  final Map<String, Coupon> _coupons;
  @override
  Map<String, Coupon> get coupons {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coupons);
  }

  @override
  String toString() {
    return 'Tester(index: $index, coupons: $coupons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tester &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._coupons, _coupons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, index, const DeepCollectionEquality().hash(_coupons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TesterCopyWith<_$_Tester> get copyWith =>
      __$$_TesterCopyWithImpl<_$_Tester>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TesterToJson(
      this,
    );
  }
}

abstract class _Tester implements Tester {
  const factory _Tester(
      {required final int index,
      required final Map<String, Coupon> coupons}) = _$_Tester;

  factory _Tester.fromJson(Map<String, dynamic> json) = _$_Tester.fromJson;

  @override
  int get index;
  @override
  Map<String, Coupon> get coupons;
  @override
  @JsonKey(ignore: true)
  _$$_TesterCopyWith<_$_Tester> get copyWith =>
      throw _privateConstructorUsedError;
}
