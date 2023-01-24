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
  double? get discount => throw _privateConstructorUsedError;
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
      _$OrderSummaryCopyWithImpl<$Res>;
  $Res call(
      {int totalItems,
      double subTotal,
      @JsonKey(defaultValue: null) double? discount,
      @JsonKey(defaultValue: null) double? shippingCost,
      @JsonKey(defaultValue: null) double? total});
}

/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res> implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._value, this._then);

  final OrderSummary _value;
  // ignore: unused_field
  final $Res Function(OrderSummary) _then;

  @override
  $Res call({
    Object? totalItems = freezed,
    Object? subTotal = freezed,
    Object? discount = freezed,
    Object? shippingCost = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: shippingCost == freezed
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderSummaryCopyWith<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  factory _$$_OrderSummaryCopyWith(
          _$_OrderSummary value, $Res Function(_$_OrderSummary) then) =
      __$$_OrderSummaryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalItems,
      double subTotal,
      @JsonKey(defaultValue: null) double? discount,
      @JsonKey(defaultValue: null) double? shippingCost,
      @JsonKey(defaultValue: null) double? total});
}

/// @nodoc
class __$$_OrderSummaryCopyWithImpl<$Res>
    extends _$OrderSummaryCopyWithImpl<$Res>
    implements _$$_OrderSummaryCopyWith<$Res> {
  __$$_OrderSummaryCopyWithImpl(
      _$_OrderSummary _value, $Res Function(_$_OrderSummary) _then)
      : super(_value, (v) => _then(v as _$_OrderSummary));

  @override
  _$_OrderSummary get _value => super._value as _$_OrderSummary;

  @override
  $Res call({
    Object? totalItems = freezed,
    Object? subTotal = freezed,
    Object? discount = freezed,
    Object? shippingCost = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_OrderSummary(
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      discount: discount == freezed
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: shippingCost == freezed
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
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
  final double? discount;
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
            const DeepCollectionEquality()
                .equals(other.totalItems, totalItems) &&
            const DeepCollectionEquality().equals(other.subTotal, subTotal) &&
            const DeepCollectionEquality().equals(other.discount, discount) &&
            const DeepCollectionEquality()
                .equals(other.shippingCost, shippingCost) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalItems),
      const DeepCollectionEquality().hash(subTotal),
      const DeepCollectionEquality().hash(discount),
      const DeepCollectionEquality().hash(shippingCost),
      const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
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
          @JsonKey(defaultValue: null) required final double? discount,
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
  double? get discount;
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
