// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) {
  return _OrderSummary.fromJson(json);
}

/// @nodoc
mixin _$OrderSummary {
  int get totalItems => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: null)
  Coupon? get discount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: null)
  double? get shippingCost => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: null)
  double? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderSummaryCopyWith<OrderSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryCopyWith<$Res> {
  factory $OrderSummaryCopyWith(
          OrderSummary value, $Res Function(OrderSummary) then) =
      _$OrderSummaryCopyWithImpl<$Res, OrderSummary>;
  @useResult
  $Res call(
      {int totalItems,
      double subTotal,
      @JsonKey(defaultValue: null) Coupon? discount,
      @JsonKey(defaultValue: null) double? shippingCost,
      @JsonKey(defaultValue: null) double? total});

  $CouponCopyWith<$Res>? get discount;
}

/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res, $Val extends OrderSummary>
    implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? subTotal = null,
    Object? discount = freezed,
    Object? shippingCost = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CouponCopyWith<$Res>? get discount {
    if (_value.discount == null) {
      return null;
    }

    return $CouponCopyWith<$Res>(_value.discount!, (value) {
      return _then(_value.copyWith(discount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderSummaryCopyWith<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  factory _$$_OrderSummaryCopyWith(
          _$_OrderSummary value, $Res Function(_$_OrderSummary) then) =
      __$$_OrderSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalItems,
      double subTotal,
      @JsonKey(defaultValue: null) Coupon? discount,
      @JsonKey(defaultValue: null) double? shippingCost,
      @JsonKey(defaultValue: null) double? total});

  @override
  $CouponCopyWith<$Res>? get discount;
}

/// @nodoc
class __$$_OrderSummaryCopyWithImpl<$Res>
    extends _$OrderSummaryCopyWithImpl<$Res, _$_OrderSummary>
    implements _$$_OrderSummaryCopyWith<$Res> {
  __$$_OrderSummaryCopyWithImpl(
      _$_OrderSummary _value, $Res Function(_$_OrderSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? subTotal = null,
    Object? discount = freezed,
    Object? shippingCost = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_OrderSummary(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Coupon?,
      shippingCost: freezed == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_OrderSummary implements _OrderSummary {
  const _$_OrderSummary(
      {required this.totalItems,
      required this.subTotal,
      @JsonKey(defaultValue: null) required this.discount,
      @JsonKey(defaultValue: null) required this.shippingCost,
      @JsonKey(defaultValue: null) required this.total});

  factory _$_OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$$_OrderSummaryFromJson(json);

  @override
  final int totalItems;
  @override
  final double subTotal;
  @override
  @JsonKey(defaultValue: null)
  final Coupon? discount;
  @override
  @JsonKey(defaultValue: null)
  final double? shippingCost;
  @override
  @JsonKey(defaultValue: null)
  final double? total;

  @override
  String toString() {
    return 'OrderSummary(totalItems: $totalItems, subTotal: $subTotal, discount: $discount, shippingCost: $shippingCost, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderSummary &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalItems, subTotal, discount, shippingCost, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderSummaryCopyWith<_$_OrderSummary> get copyWith =>
      __$$_OrderSummaryCopyWithImpl<_$_OrderSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderSummaryToJson(
      this,
    );
  }
}

abstract class _OrderSummary implements OrderSummary {
  const factory _OrderSummary(
          {required final int totalItems,
          required final double subTotal,
          @JsonKey(defaultValue: null) required final Coupon? discount,
          @JsonKey(defaultValue: null) required final double? shippingCost,
          @JsonKey(defaultValue: null) required final double? total}) =
      _$_OrderSummary;

  factory _OrderSummary.fromJson(Map<String, dynamic> json) =
      _$_OrderSummary.fromJson;

  @override
  int get totalItems;
  @override
  double get subTotal;
  @override
  @JsonKey(defaultValue: null)
  Coupon? get discount;
  @override
  @JsonKey(defaultValue: null)
  double? get shippingCost;
  @override
  @JsonKey(defaultValue: null)
  double? get total;
  @override
  @JsonKey(ignore: true)
  _$$_OrderSummaryCopyWith<_$_OrderSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
