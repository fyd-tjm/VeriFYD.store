import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_summary.freezed.dart';
part 'order_summary.g.dart';

@freezed
class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    required int totalItems,
    required double subTotal,
    @JsonKey(defaultValue: null) required double? discount,
    @JsonKey(defaultValue: null) required double? shippingCost,
    @JsonKey(defaultValue: null) required double? total,
  }) = _OrderSummary;

  factory OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryFromJson(json);
}
