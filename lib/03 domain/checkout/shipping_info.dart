import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
part 'shipping_info.freezed.dart';
part 'shipping_info.g.dart';

@freezed
class ShippingInfo with _$ShippingInfo {
  @JsonSerializable(explicitToJson: true)
  const factory ShippingInfo({
    required FydAddress shippingAddress,
    required double shippingCost,
    required String trackingUrl,
  }) = _ShippingInfo;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);
}
