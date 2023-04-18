import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';

part 'shared_info.freezed.dart';
part 'shared_info.g.dart';

@freezed
@immutable
abstract class SharedInfo with _$SharedInfo {
  @JsonSerializable(explicitToJson: true)
  const factory SharedInfo({
    required double shippingCost,
    required int totalOrders,
    required int cartLimit,
    required List<String> deliveryStates,
    required Map<String, int> liveStores,
    required Map<String, String> timmings,
    required Map<String, String> support,
    required Map<String, String> banners,
    required Map<String, Coupon> offers,
    required Map<String, String> storeSearchMap,
    required Map<String, Product> recentlyPurchased,
    required bool isPodAvailable,
  }) = _SharedInfo;

  factory SharedInfo.fromJson(Map<String, dynamic> json) =>
      _$SharedInfoFromJson(json);
}
