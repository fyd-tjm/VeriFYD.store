// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';

import 'order_summary.dart';
part 'order_Info.freezed.dart';
part 'order_Info.g.dart';

@freezed
class OrderInfo with _$OrderInfo {
  @JsonSerializable(explicitToJson: true)
  const factory OrderInfo({
    required String storeId,
    required String storeName,
    required Map<String, Map<String, int>> orderItems,
    required Map<String, Product> orderItemsDetail,
    required OrderSummary orderSummary,
  }) = _OrderInfo;

  factory OrderInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoFromJson(json);
}
