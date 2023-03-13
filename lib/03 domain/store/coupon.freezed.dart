// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coupon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coupon _$CouponFromJson(Map<String, dynamic> json) {
  return _Coupon.fromJson(json);
}

/// @nodoc
mixin _$Coupon {
  String get code => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get termsAndCondition => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get validTill => throw _privateConstructorUsedError;
  double? get onOrderValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponCopyWith<Coupon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponCopyWith<$Res> {
  factory $CouponCopyWith(Coupon value, $Res Function(Coupon) then) =
      _$CouponCopyWithImpl<$Res, Coupon>;
  @useResult
  $Res call(
      {String code,
      double value,
      bool isActive,
      bool isHidden,
      String message,
      String termsAndCondition,
      @TimestampConverter() DateTime validTill,
      double? onOrderValue});
}

/// @nodoc
class _$CouponCopyWithImpl<$Res, $Val extends Coupon>
    implements $CouponCopyWith<$Res> {
  _$CouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? value = null,
    Object? isActive = null,
    Object? isHidden = null,
    Object? message = null,
    Object? termsAndCondition = null,
    Object? validTill = null,
    Object? onOrderValue = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndCondition: null == termsAndCondition
          ? _value.termsAndCondition
          : termsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      validTill: null == validTill
          ? _value.validTill
          : validTill // ignore: cast_nullable_to_non_nullable
              as DateTime,
      onOrderValue: freezed == onOrderValue
          ? _value.onOrderValue
          : onOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponCopyWith<$Res> implements $CouponCopyWith<$Res> {
  factory _$$_CouponCopyWith(_$_Coupon value, $Res Function(_$_Coupon) then) =
      __$$_CouponCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      double value,
      bool isActive,
      bool isHidden,
      String message,
      String termsAndCondition,
      @TimestampConverter() DateTime validTill,
      double? onOrderValue});
}

/// @nodoc
class __$$_CouponCopyWithImpl<$Res>
    extends _$CouponCopyWithImpl<$Res, _$_Coupon>
    implements _$$_CouponCopyWith<$Res> {
  __$$_CouponCopyWithImpl(_$_Coupon _value, $Res Function(_$_Coupon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? value = null,
    Object? isActive = null,
    Object? isHidden = null,
    Object? message = null,
    Object? termsAndCondition = null,
    Object? validTill = null,
    Object? onOrderValue = freezed,
  }) {
    return _then(_$_Coupon(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      termsAndCondition: null == termsAndCondition
          ? _value.termsAndCondition
          : termsAndCondition // ignore: cast_nullable_to_non_nullable
              as String,
      validTill: null == validTill
          ? _value.validTill
          : validTill // ignore: cast_nullable_to_non_nullable
              as DateTime,
      onOrderValue: freezed == onOrderValue
          ? _value.onOrderValue
          : onOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coupon implements _Coupon {
  const _$_Coupon(
      {required this.code,
      required this.value,
      required this.isActive,
      required this.isHidden,
      required this.message,
      required this.termsAndCondition,
      @TimestampConverter() required this.validTill,
      required this.onOrderValue});

  factory _$_Coupon.fromJson(Map<String, dynamic> json) =>
      _$$_CouponFromJson(json);

  @override
  final String code;
  @override
  final double value;
  @override
  final bool isActive;
  @override
  final bool isHidden;
  @override
  final String message;
  @override
  final String termsAndCondition;
  @override
  @TimestampConverter()
  final DateTime validTill;
  @override
  final double? onOrderValue;

  @override
  String toString() {
    return 'Coupon(code: $code, value: $value, isActive: $isActive, isHidden: $isHidden, message: $message, termsAndCondition: $termsAndCondition, validTill: $validTill, onOrderValue: $onOrderValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coupon &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.termsAndCondition, termsAndCondition) ||
                other.termsAndCondition == termsAndCondition) &&
            (identical(other.validTill, validTill) ||
                other.validTill == validTill) &&
            (identical(other.onOrderValue, onOrderValue) ||
                other.onOrderValue == onOrderValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, value, isActive, isHidden,
      message, termsAndCondition, validTill, onOrderValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      __$$_CouponCopyWithImpl<_$_Coupon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponToJson(
      this,
    );
  }
}

abstract class _Coupon implements Coupon {
  const factory _Coupon(
      {required final String code,
      required final double value,
      required final bool isActive,
      required final bool isHidden,
      required final String message,
      required final String termsAndCondition,
      @TimestampConverter() required final DateTime validTill,
      required final double? onOrderValue}) = _$_Coupon;

  factory _Coupon.fromJson(Map<String, dynamic> json) = _$_Coupon.fromJson;

  @override
  String get code;
  @override
  double get value;
  @override
  bool get isActive;
  @override
  bool get isHidden;
  @override
  String get message;
  @override
  String get termsAndCondition;
  @override
  @TimestampConverter()
  DateTime get validTill;
  @override
  double? get onOrderValue;
  @override
  @JsonKey(ignore: true)
  _$$_CouponCopyWith<_$_Coupon> get copyWith =>
      throw _privateConstructorUsedError;
}
