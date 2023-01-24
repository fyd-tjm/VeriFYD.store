// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_info.freezed.dart';
part 'payment_info.g.dart';

//?-----------------------------------------------------------------------------
//! PaymentInfo

@freezed
class PaymentInfo with _$PaymentInfo {
  @JsonSerializable(explicitToJson: true)
  const factory PaymentInfo({
    required double paymentAmount,
    required PaymentMode paymentMode,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}

//?-----------------------------------------------------------------------------
//! payment_mode: (online/payOnDelivery)

@freezed
class PaymentMode with _$PaymentMode {
  const factory PaymentMode.online({String? paymentId}) = Online;
  const factory PaymentMode.payOnDelivery() = PayOnDelivery;

  factory PaymentMode.fromJson(Map<String, dynamic> json) =>
      _$PaymentModeFromJson(json);
}
//?-----------------------------------------------------------------------------