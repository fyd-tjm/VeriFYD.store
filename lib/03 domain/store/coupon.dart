import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/core/converters.dart';
part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    required String code,
    required double value,
    required bool isActive,
    required bool isHidden,
    required String message,
    required String termsAndCondition,
    @TimestampConverter() required DateTime validTill,
    required double? onOrderValue,
  }) = _Coupon;
  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
//?-----------------------------------------------------------------------------

