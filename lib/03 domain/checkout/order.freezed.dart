// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FydOrder _$FydOrderFromJson(Map<String, dynamic> json) {
  return _FydOrder.fromJson(json);
}

/// @nodoc
mixin _$FydOrder {
  String get orderId => throw _privateConstructorUsedError;
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  OrderInfo get orderInfo => throw _privateConstructorUsedError;
  ShippingInfo get shippingInfo => throw _privateConstructorUsedError;
  PaymentInfo get paymentInfo => throw _privateConstructorUsedError;
  CustomerInfo get customerInfo => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get orderDate => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get deliveryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FydOrderCopyWith<FydOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FydOrderCopyWith<$Res> {
  factory $FydOrderCopyWith(FydOrder value, $Res Function(FydOrder) then) =
      _$FydOrderCopyWithImpl<$Res, FydOrder>;
  @useResult
  $Res call(
      {String orderId,
      OrderStatus orderStatus,
      OrderInfo orderInfo,
      ShippingInfo shippingInfo,
      PaymentInfo paymentInfo,
      CustomerInfo customerInfo,
      @TimestampNullableConverter() DateTime? orderDate,
      @TimestampNullableConverter() DateTime? deliveryDate});

  $OrderStatusCopyWith<$Res> get orderStatus;
  $OrderInfoCopyWith<$Res> get orderInfo;
  $ShippingInfoCopyWith<$Res> get shippingInfo;
  $PaymentInfoCopyWith<$Res> get paymentInfo;
  $CustomerInfoCopyWith<$Res> get customerInfo;
}

/// @nodoc
class _$FydOrderCopyWithImpl<$Res, $Val extends FydOrder>
    implements $FydOrderCopyWith<$Res> {
  _$FydOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderStatus = null,
    Object? orderInfo = null,
    Object? shippingInfo = null,
    Object? paymentInfo = null,
    Object? customerInfo = null,
    Object? orderDate = freezed,
    Object? deliveryDate = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      orderInfo: null == orderInfo
          ? _value.orderInfo
          : orderInfo // ignore: cast_nullable_to_non_nullable
              as OrderInfo,
      shippingInfo: null == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      customerInfo: null == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderStatusCopyWith<$Res> get orderStatus {
    return $OrderStatusCopyWith<$Res>(_value.orderStatus, (value) {
      return _then(_value.copyWith(orderStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderInfoCopyWith<$Res> get orderInfo {
    return $OrderInfoCopyWith<$Res>(_value.orderInfo, (value) {
      return _then(_value.copyWith(orderInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShippingInfoCopyWith<$Res> get shippingInfo {
    return $ShippingInfoCopyWith<$Res>(_value.shippingInfo, (value) {
      return _then(_value.copyWith(shippingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res> get customerInfo {
    return $CustomerInfoCopyWith<$Res>(_value.customerInfo, (value) {
      return _then(_value.copyWith(customerInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FydOrderCopyWith<$Res> implements $FydOrderCopyWith<$Res> {
  factory _$$_FydOrderCopyWith(
          _$_FydOrder value, $Res Function(_$_FydOrder) then) =
      __$$_FydOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      OrderStatus orderStatus,
      OrderInfo orderInfo,
      ShippingInfo shippingInfo,
      PaymentInfo paymentInfo,
      CustomerInfo customerInfo,
      @TimestampNullableConverter() DateTime? orderDate,
      @TimestampNullableConverter() DateTime? deliveryDate});

  @override
  $OrderStatusCopyWith<$Res> get orderStatus;
  @override
  $OrderInfoCopyWith<$Res> get orderInfo;
  @override
  $ShippingInfoCopyWith<$Res> get shippingInfo;
  @override
  $PaymentInfoCopyWith<$Res> get paymentInfo;
  @override
  $CustomerInfoCopyWith<$Res> get customerInfo;
}

/// @nodoc
class __$$_FydOrderCopyWithImpl<$Res>
    extends _$FydOrderCopyWithImpl<$Res, _$_FydOrder>
    implements _$$_FydOrderCopyWith<$Res> {
  __$$_FydOrderCopyWithImpl(
      _$_FydOrder _value, $Res Function(_$_FydOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderStatus = null,
    Object? orderInfo = null,
    Object? shippingInfo = null,
    Object? paymentInfo = null,
    Object? customerInfo = null,
    Object? orderDate = freezed,
    Object? deliveryDate = freezed,
  }) {
    return _then(_$_FydOrder(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      orderInfo: null == orderInfo
          ? _value.orderInfo
          : orderInfo // ignore: cast_nullable_to_non_nullable
              as OrderInfo,
      shippingInfo: null == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      customerInfo: null == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FydOrder implements _FydOrder {
  const _$_FydOrder(
      {required this.orderId,
      required this.orderStatus,
      required this.orderInfo,
      required this.shippingInfo,
      required this.paymentInfo,
      required this.customerInfo,
      @TimestampNullableConverter() required this.orderDate,
      @TimestampNullableConverter() required this.deliveryDate});

  factory _$_FydOrder.fromJson(Map<String, dynamic> json) =>
      _$$_FydOrderFromJson(json);

  @override
  final String orderId;
  @override
  final OrderStatus orderStatus;
  @override
  final OrderInfo orderInfo;
  @override
  final ShippingInfo shippingInfo;
  @override
  final PaymentInfo paymentInfo;
  @override
  final CustomerInfo customerInfo;
  @override
  @TimestampNullableConverter()
  final DateTime? orderDate;
  @override
  @TimestampNullableConverter()
  final DateTime? deliveryDate;

  @override
  String toString() {
    return 'FydOrder(orderId: $orderId, orderStatus: $orderStatus, orderInfo: $orderInfo, shippingInfo: $shippingInfo, paymentInfo: $paymentInfo, customerInfo: $customerInfo, orderDate: $orderDate, deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FydOrder &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.orderInfo, orderInfo) ||
                other.orderInfo == orderInfo) &&
            (identical(other.shippingInfo, shippingInfo) ||
                other.shippingInfo == shippingInfo) &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, orderStatus, orderInfo,
      shippingInfo, paymentInfo, customerInfo, orderDate, deliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FydOrderCopyWith<_$_FydOrder> get copyWith =>
      __$$_FydOrderCopyWithImpl<_$_FydOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FydOrderToJson(
      this,
    );
  }
}

abstract class _FydOrder implements FydOrder {
  const factory _FydOrder(
      {required final String orderId,
      required final OrderStatus orderStatus,
      required final OrderInfo orderInfo,
      required final ShippingInfo shippingInfo,
      required final PaymentInfo paymentInfo,
      required final CustomerInfo customerInfo,
      @TimestampNullableConverter()
          required final DateTime? orderDate,
      @TimestampNullableConverter()
          required final DateTime? deliveryDate}) = _$_FydOrder;

  factory _FydOrder.fromJson(Map<String, dynamic> json) = _$_FydOrder.fromJson;

  @override
  String get orderId;
  @override
  OrderStatus get orderStatus;
  @override
  OrderInfo get orderInfo;
  @override
  ShippingInfo get shippingInfo;
  @override
  PaymentInfo get paymentInfo;
  @override
  CustomerInfo get customerInfo;
  @override
  @TimestampNullableConverter()
  DateTime? get orderDate;
  @override
  @TimestampNullableConverter()
  DateTime? get deliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_FydOrderCopyWith<_$_FydOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'failure':
      return Failure.fromJson(json);
    case 'success':
      return Success.fromJson(json);
    case 'confirmed':
      return Confirmed.fromJson(json);
    case 'declined':
      return Declined.fromJson(json);
    case 'shipped':
      return Shipped.fromJson(json);
    case 'delivered':
      return Delivered.fromJson(json);
    case 'fullFilled':
      return FullFilled.fromJson(json);
    case 'refunded':
      return Refunded.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OrderStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OrderStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusCopyWith<$Res> {
  factory $OrderStatusCopyWith(
          OrderStatus value, $Res Function(OrderStatus) then) =
      _$OrderStatusCopyWithImpl<$Res, OrderStatus>;
}

/// @nodoc
class _$OrderStatusCopyWithImpl<$Res, $Val extends OrderStatus>
    implements $OrderStatusCopyWith<$Res> {
  _$OrderStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FailureCopyWith<$Res> {
  factory _$$FailureCopyWith(_$Failure value, $Res Function(_$Failure) then) =
      __$$FailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentMode paymentMode});

  $PaymentModeCopyWith<$Res> get paymentMode;
}

/// @nodoc
class __$$FailureCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Failure>
    implements _$$FailureCopyWith<$Res> {
  __$$FailureCopyWithImpl(_$Failure _value, $Res Function(_$Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMode = null,
  }) {
    return _then(_$Failure(
      paymentMode: null == paymentMode
          ? _value.paymentMode
          : paymentMode // ignore: cast_nullable_to_non_nullable
              as PaymentMode,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModeCopyWith<$Res> get paymentMode {
    return $PaymentModeCopyWith<$Res>(_value.paymentMode, (value) {
      return _then(_value.copyWith(paymentMode: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$Failure implements Failure {
  const _$Failure({required this.paymentMode, final String? $type})
      : $type = $type ?? 'failure';

  factory _$Failure.fromJson(Map<String, dynamic> json) =>
      _$$FailureFromJson(json);

  @override
  final PaymentMode paymentMode;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.failure(paymentMode: $paymentMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure &&
            (identical(other.paymentMode, paymentMode) ||
                other.paymentMode == paymentMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<_$Failure> get copyWith =>
      __$$FailureCopyWithImpl<_$Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return failure(paymentMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return failure?.call(paymentMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(paymentMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FailureToJson(
      this,
    );
  }
}

abstract class Failure implements OrderStatus {
  const factory Failure({required final PaymentMode paymentMode}) = _$Failure;

  factory Failure.fromJson(Map<String, dynamic> json) = _$Failure.fromJson;

  PaymentMode get paymentMode;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<_$Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Success implements Success {
  const _$Success({final String? $type}) : $type = $type ?? 'success';

  factory _$Success.fromJson(Map<String, dynamic> json) =>
      _$$SuccessFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Success);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessToJson(
      this,
    );
  }
}

abstract class Success implements OrderStatus {
  const factory Success() = _$Success;

  factory Success.fromJson(Map<String, dynamic> json) = _$Success.fromJson;
}

/// @nodoc
abstract class _$$ConfirmedCopyWith<$Res> {
  factory _$$ConfirmedCopyWith(
          _$Confirmed value, $Res Function(_$Confirmed) then) =
      __$$ConfirmedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConfirmedCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Confirmed>
    implements _$$ConfirmedCopyWith<$Res> {
  __$$ConfirmedCopyWithImpl(
      _$Confirmed _value, $Res Function(_$Confirmed) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Confirmed implements Confirmed {
  const _$Confirmed({final String? $type}) : $type = $type ?? 'confirmed';

  factory _$Confirmed.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.confirmed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Confirmed);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return confirmed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return confirmed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (confirmed != null) {
      return confirmed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return confirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return confirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (confirmed != null) {
      return confirmed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmedToJson(
      this,
    );
  }
}

abstract class Confirmed implements OrderStatus {
  const factory Confirmed() = _$Confirmed;

  factory Confirmed.fromJson(Map<String, dynamic> json) = _$Confirmed.fromJson;
}

/// @nodoc
abstract class _$$DeclinedCopyWith<$Res> {
  factory _$$DeclinedCopyWith(
          _$Declined value, $Res Function(_$Declined) then) =
      __$$DeclinedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeclinedCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Declined>
    implements _$$DeclinedCopyWith<$Res> {
  __$$DeclinedCopyWithImpl(_$Declined _value, $Res Function(_$Declined) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Declined implements Declined {
  const _$Declined({final String? $type}) : $type = $type ?? 'declined';

  factory _$Declined.fromJson(Map<String, dynamic> json) =>
      _$$DeclinedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.declined()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Declined);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return declined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return declined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return declined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return declined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclinedToJson(
      this,
    );
  }
}

abstract class Declined implements OrderStatus {
  const factory Declined() = _$Declined;

  factory Declined.fromJson(Map<String, dynamic> json) = _$Declined.fromJson;
}

/// @nodoc
abstract class _$$ShippedCopyWith<$Res> {
  factory _$$ShippedCopyWith(_$Shipped value, $Res Function(_$Shipped) then) =
      __$$ShippedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShippedCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Shipped>
    implements _$$ShippedCopyWith<$Res> {
  __$$ShippedCopyWithImpl(_$Shipped _value, $Res Function(_$Shipped) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Shipped implements Shipped {
  const _$Shipped({final String? $type}) : $type = $type ?? 'shipped';

  factory _$Shipped.fromJson(Map<String, dynamic> json) =>
      _$$ShippedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.shipped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Shipped);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return shipped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return shipped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (shipped != null) {
      return shipped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return shipped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return shipped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (shipped != null) {
      return shipped(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippedToJson(
      this,
    );
  }
}

abstract class Shipped implements OrderStatus {
  const factory Shipped() = _$Shipped;

  factory Shipped.fromJson(Map<String, dynamic> json) = _$Shipped.fromJson;
}

/// @nodoc
abstract class _$$DeliveredCopyWith<$Res> {
  factory _$$DeliveredCopyWith(
          _$Delivered value, $Res Function(_$Delivered) then) =
      __$$DeliveredCopyWithImpl<$Res>;
  @useResult
  $Res call({String? deliveryDate});
}

/// @nodoc
class __$$DeliveredCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Delivered>
    implements _$$DeliveredCopyWith<$Res> {
  __$$DeliveredCopyWithImpl(
      _$Delivered _value, $Res Function(_$Delivered) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryDate = freezed,
  }) {
    return _then(_$Delivered(
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Delivered implements Delivered {
  const _$Delivered({this.deliveryDate, final String? $type})
      : $type = $type ?? 'delivered';

  factory _$Delivered.fromJson(Map<String, dynamic> json) =>
      _$$DeliveredFromJson(json);

  @override
  final String? deliveryDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.delivered(deliveryDate: $deliveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Delivered &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveredCopyWith<_$Delivered> get copyWith =>
      __$$DeliveredCopyWithImpl<_$Delivered>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return delivered(deliveryDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return delivered?.call(deliveryDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(deliveryDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return delivered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return delivered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveredToJson(
      this,
    );
  }
}

abstract class Delivered implements OrderStatus {
  const factory Delivered({final String? deliveryDate}) = _$Delivered;

  factory Delivered.fromJson(Map<String, dynamic> json) = _$Delivered.fromJson;

  String? get deliveryDate;
  @JsonKey(ignore: true)
  _$$DeliveredCopyWith<_$Delivered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FullFilledCopyWith<$Res> {
  factory _$$FullFilledCopyWith(
          _$FullFilled value, $Res Function(_$FullFilled) then) =
      __$$FullFilledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FullFilledCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$FullFilled>
    implements _$$FullFilledCopyWith<$Res> {
  __$$FullFilledCopyWithImpl(
      _$FullFilled _value, $Res Function(_$FullFilled) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$FullFilled implements FullFilled {
  const _$FullFilled({final String? $type}) : $type = $type ?? 'fullFilled';

  factory _$FullFilled.fromJson(Map<String, dynamic> json) =>
      _$$FullFilledFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.fullFilled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FullFilled);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return fullFilled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return fullFilled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (fullFilled != null) {
      return fullFilled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return fullFilled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return fullFilled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (fullFilled != null) {
      return fullFilled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FullFilledToJson(
      this,
    );
  }
}

abstract class FullFilled implements OrderStatus {
  const factory FullFilled() = _$FullFilled;

  factory FullFilled.fromJson(Map<String, dynamic> json) =
      _$FullFilled.fromJson;
}

/// @nodoc
abstract class _$$RefundedCopyWith<$Res> {
  factory _$$RefundedCopyWith(
          _$Refunded value, $Res Function(_$Refunded) then) =
      __$$RefundedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? refundId});
}

/// @nodoc
class __$$RefundedCopyWithImpl<$Res>
    extends _$OrderStatusCopyWithImpl<$Res, _$Refunded>
    implements _$$RefundedCopyWith<$Res> {
  __$$RefundedCopyWithImpl(_$Refunded _value, $Res Function(_$Refunded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refundId = freezed,
  }) {
    return _then(_$Refunded(
      refundId: freezed == refundId
          ? _value.refundId
          : refundId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Refunded implements Refunded {
  const _$Refunded({this.refundId, final String? $type})
      : $type = $type ?? 'refunded';

  factory _$Refunded.fromJson(Map<String, dynamic> json) =>
      _$$RefundedFromJson(json);

  @override
  final String? refundId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OrderStatus.refunded(refundId: $refundId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refunded &&
            (identical(other.refundId, refundId) ||
                other.refundId == refundId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refundId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundedCopyWith<_$Refunded> get copyWith =>
      __$$RefundedCopyWithImpl<_$Refunded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentMode paymentMode) failure,
    required TResult Function() success,
    required TResult Function() confirmed,
    required TResult Function() declined,
    required TResult Function() shipped,
    required TResult Function(String? deliveryDate) delivered,
    required TResult Function() fullFilled,
    required TResult Function(String? refundId) refunded,
  }) {
    return refunded(refundId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentMode paymentMode)? failure,
    TResult? Function()? success,
    TResult? Function()? confirmed,
    TResult? Function()? declined,
    TResult? Function()? shipped,
    TResult? Function(String? deliveryDate)? delivered,
    TResult? Function()? fullFilled,
    TResult? Function(String? refundId)? refunded,
  }) {
    return refunded?.call(refundId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentMode paymentMode)? failure,
    TResult Function()? success,
    TResult Function()? confirmed,
    TResult Function()? declined,
    TResult Function()? shipped,
    TResult Function(String? deliveryDate)? delivered,
    TResult Function()? fullFilled,
    TResult Function(String? refundId)? refunded,
    required TResult orElse(),
  }) {
    if (refunded != null) {
      return refunded(refundId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
    required TResult Function(Confirmed value) confirmed,
    required TResult Function(Declined value) declined,
    required TResult Function(Shipped value) shipped,
    required TResult Function(Delivered value) delivered,
    required TResult Function(FullFilled value) fullFilled,
    required TResult Function(Refunded value) refunded,
  }) {
    return refunded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
    TResult? Function(Confirmed value)? confirmed,
    TResult? Function(Declined value)? declined,
    TResult? Function(Shipped value)? shipped,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(FullFilled value)? fullFilled,
    TResult? Function(Refunded value)? refunded,
  }) {
    return refunded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    TResult Function(Confirmed value)? confirmed,
    TResult Function(Declined value)? declined,
    TResult Function(Shipped value)? shipped,
    TResult Function(Delivered value)? delivered,
    TResult Function(FullFilled value)? fullFilled,
    TResult Function(Refunded value)? refunded,
    required TResult orElse(),
  }) {
    if (refunded != null) {
      return refunded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundedToJson(
      this,
    );
  }
}

abstract class Refunded implements OrderStatus {
  const factory Refunded({final String? refundId}) = _$Refunded;

  factory Refunded.fromJson(Map<String, dynamic> json) = _$Refunded.fromJson;

  String? get refundId;
  @JsonKey(ignore: true)
  _$$RefundedCopyWith<_$Refunded> get copyWith =>
      throw _privateConstructorUsedError;
}
