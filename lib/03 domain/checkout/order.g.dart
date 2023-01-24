// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FydOrder _$$_FydOrderFromJson(Map<String, dynamic> json) => _$_FydOrder(
      orderId: json['orderId'] as String,
      orderStatus:
          OrderStatus.fromJson(json['orderStatus'] as Map<String, dynamic>),
      orderInfo: OrderInfo.fromJson(json['orderInfo'] as Map<String, dynamic>),
      shippingInfo:
          ShippingInfo.fromJson(json['shippingInfo'] as Map<String, dynamic>),
      paymentInfo:
          PaymentInfo.fromJson(json['paymentInfo'] as Map<String, dynamic>),
      customerInfo:
          CustomerInfo.fromJson(json['customerInfo'] as Map<String, dynamic>),
      orderDate: const TimestampNullableConverter()
          .fromJson(json['orderDate'] as Timestamp?),
      deliveryDate: const TimestampNullableConverter()
          .fromJson(json['deliveryDate'] as Timestamp?),
    );

Map<String, dynamic> _$$_FydOrderToJson(_$_FydOrder instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderStatus': instance.orderStatus.toJson(),
      'orderInfo': instance.orderInfo.toJson(),
      'shippingInfo': instance.shippingInfo.toJson(),
      'paymentInfo': instance.paymentInfo.toJson(),
      'customerInfo': instance.customerInfo.toJson(),
      'orderDate':
          const TimestampNullableConverter().toJson(instance.orderDate),
      'deliveryDate':
          const TimestampNullableConverter().toJson(instance.deliveryDate),
    };

_$Failure _$$FailureFromJson(Map<String, dynamic> json) => _$Failure(
      paymentMode:
          PaymentMode.fromJson(json['paymentMode'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailureToJson(_$Failure instance) => <String, dynamic>{
      'paymentMode': instance.paymentMode,
      'runtimeType': instance.$type,
    };

_$Success _$$SuccessFromJson(Map<String, dynamic> json) => _$Success(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessToJson(_$Success instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Confirmed _$$ConfirmedFromJson(Map<String, dynamic> json) => _$Confirmed(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ConfirmedToJson(_$Confirmed instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Declined _$$DeclinedFromJson(Map<String, dynamic> json) => _$Declined(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeclinedToJson(_$Declined instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Shipped _$$ShippedFromJson(Map<String, dynamic> json) => _$Shipped(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ShippedToJson(_$Shipped instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Delivered _$$DeliveredFromJson(Map<String, dynamic> json) => _$Delivered(
      deliveryDate: json['deliveryDate'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeliveredToJson(_$Delivered instance) =>
    <String, dynamic>{
      'deliveryDate': instance.deliveryDate,
      'runtimeType': instance.$type,
    };

_$FullFilled _$$FullFilledFromJson(Map<String, dynamic> json) => _$FullFilled(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FullFilledToJson(_$FullFilled instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$Refunded _$$RefundedFromJson(Map<String, dynamic> json) => _$Refunded(
      refundId: json['refundId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RefundedToJson(_$Refunded instance) =>
    <String, dynamic>{
      'refundId': instance.refundId,
      'runtimeType': instance.$type,
    };
