// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_Info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return _OrderInfo.fromJson(json);
}

/// @nodoc
mixin _$OrderInfo {
  String get storeId => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  Map<String, Map<String, int>> get orderItems =>
      throw _privateConstructorUsedError;
  Map<String, Product> get orderItemsDetail =>
      throw _privateConstructorUsedError;
  OrderSummary get orderSummary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderInfoCopyWith<OrderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInfoCopyWith<$Res> {
  factory $OrderInfoCopyWith(OrderInfo value, $Res Function(OrderInfo) then) =
      _$OrderInfoCopyWithImpl<$Res, OrderInfo>;
  @useResult
  $Res call(
      {String storeId,
      String storeName,
      Map<String, Map<String, int>> orderItems,
      Map<String, Product> orderItemsDetail,
      OrderSummary orderSummary});

  $OrderSummaryCopyWith<$Res> get orderSummary;
}

/// @nodoc
class _$OrderInfoCopyWithImpl<$Res, $Val extends OrderInfo>
    implements $OrderInfoCopyWith<$Res> {
  _$OrderInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? orderItems = null,
    Object? orderItemsDetail = null,
    Object? orderSummary = null,
  }) {
    return _then(_value.copyWith(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
      orderItemsDetail: null == orderItemsDetail
          ? _value.orderItemsDetail
          : orderItemsDetail // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>,
      orderSummary: null == orderSummary
          ? _value.orderSummary
          : orderSummary // ignore: cast_nullable_to_non_nullable
              as OrderSummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderSummaryCopyWith<$Res> get orderSummary {
    return $OrderSummaryCopyWith<$Res>(_value.orderSummary, (value) {
      return _then(_value.copyWith(orderSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderInfoCopyWith<$Res> implements $OrderInfoCopyWith<$Res> {
  factory _$$_OrderInfoCopyWith(
          _$_OrderInfo value, $Res Function(_$_OrderInfo) then) =
      __$$_OrderInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String storeId,
      String storeName,
      Map<String, Map<String, int>> orderItems,
      Map<String, Product> orderItemsDetail,
      OrderSummary orderSummary});

  @override
  $OrderSummaryCopyWith<$Res> get orderSummary;
}

/// @nodoc
class __$$_OrderInfoCopyWithImpl<$Res>
    extends _$OrderInfoCopyWithImpl<$Res, _$_OrderInfo>
    implements _$$_OrderInfoCopyWith<$Res> {
  __$$_OrderInfoCopyWithImpl(
      _$_OrderInfo _value, $Res Function(_$_OrderInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeId = null,
    Object? storeName = null,
    Object? orderItems = null,
    Object? orderItemsDetail = null,
    Object? orderSummary = null,
  }) {
    return _then(_$_OrderInfo(
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, int>>,
      orderItemsDetail: null == orderItemsDetail
          ? _value._orderItemsDetail
          : orderItemsDetail // ignore: cast_nullable_to_non_nullable
              as Map<String, Product>,
      orderSummary: null == orderSummary
          ? _value.orderSummary
          : orderSummary // ignore: cast_nullable_to_non_nullable
              as OrderSummary,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_OrderInfo implements _OrderInfo {
  const _$_OrderInfo(
      {required this.storeId,
      required this.storeName,
      required final Map<String, Map<String, int>> orderItems,
      required final Map<String, Product> orderItemsDetail,
      required this.orderSummary})
      : _orderItems = orderItems,
        _orderItemsDetail = orderItemsDetail;

  factory _$_OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$$_OrderInfoFromJson(json);

  @override
  final String storeId;
  @override
  final String storeName;
  final Map<String, Map<String, int>> _orderItems;
  @override
  Map<String, Map<String, int>> get orderItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderItems);
  }

  final Map<String, Product> _orderItemsDetail;
  @override
  Map<String, Product> get orderItemsDetail {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderItemsDetail);
  }

  @override
  final OrderSummary orderSummary;

  @override
  String toString() {
    return 'OrderInfo(storeId: $storeId, storeName: $storeName, orderItems: $orderItems, orderItemsDetail: $orderItemsDetail, orderSummary: $orderSummary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderInfo &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            const DeepCollectionEquality()
                .equals(other._orderItemsDetail, _orderItemsDetail) &&
            (identical(other.orderSummary, orderSummary) ||
                other.orderSummary == orderSummary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeId,
      storeName,
      const DeepCollectionEquality().hash(_orderItems),
      const DeepCollectionEquality().hash(_orderItemsDetail),
      orderSummary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderInfoCopyWith<_$_OrderInfo> get copyWith =>
      __$$_OrderInfoCopyWithImpl<_$_OrderInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderInfoToJson(
      this,
    );
  }
}

abstract class _OrderInfo implements OrderInfo {
  const factory _OrderInfo(
      {required final String storeId,
      required final String storeName,
      required final Map<String, Map<String, int>> orderItems,
      required final Map<String, Product> orderItemsDetail,
      required final OrderSummary orderSummary}) = _$_OrderInfo;

  factory _OrderInfo.fromJson(Map<String, dynamic> json) =
      _$_OrderInfo.fromJson;

  @override
  String get storeId;
  @override
  String get storeName;
  @override
  Map<String, Map<String, int>> get orderItems;
  @override
  Map<String, Product> get orderItemsDetail;
  @override
  OrderSummary get orderSummary;
  @override
  @JsonKey(ignore: true)
  _$$_OrderInfoCopyWith<_$_OrderInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
