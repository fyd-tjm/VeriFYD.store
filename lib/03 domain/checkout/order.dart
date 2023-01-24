// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/checkout/customer_info.dart';
import 'package:verifyd_store/03%20domain/checkout/order_Info.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/checkout/shipping_info.dart';

import '../core/00_export_core_domain.dart';

part 'order.g.dart';
part 'order.freezed.dart';

//?-----------------------------------------------------------------------------
//! Order

@freezed
class FydOrder with _$FydOrder {
  @JsonSerializable(explicitToJson: true)
  const factory FydOrder({
    required String orderId,
    required OrderStatus orderStatus,
    required OrderInfo orderInfo,
    required ShippingInfo shippingInfo,
    required PaymentInfo paymentInfo,
    required CustomerInfo customerInfo,
    @TimestampNullableConverter() required DateTime? orderDate,
    @TimestampNullableConverter() required DateTime? deliveryDate,
  }) = _FydOrder;

  factory FydOrder.fromJson(Map<String, dynamic> json) =>
      _$FydOrderFromJson(json);
}
//?-----------------------------------------------------------------------------

@freezed
class OrderStatus with _$OrderStatus {
  const factory OrderStatus.failure({required PaymentMode paymentMode}) =
      Failure;
  const factory OrderStatus.success() = Success;
  const factory OrderStatus.confirmed() = Confirmed;
  const factory OrderStatus.declined() = Declined;
  const factory OrderStatus.shipped() = Shipped;
  const factory OrderStatus.delivered({String? deliveryDate}) = Delivered;
  const factory OrderStatus.fullFilled() = FullFilled;
  const factory OrderStatus.refunded({String? refundId}) = Refunded;

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);
}
//?-----------------------------------------------------------------------------