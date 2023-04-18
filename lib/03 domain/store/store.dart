import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:verifyd_store/03%20domain/store/coupon.dart';
part 'store.freezed.dart';
part 'store.g.dart';

@freezed
abstract class Store with _$Store {
  @JsonSerializable(explicitToJson: true)
  const factory Store({
    required String storeId,
    required String name,
    required List<String> categories,
    required Map<String, int> types,
    required Map<String, String> socialPresence,
    required Map<int, String> featuredIn,
    required double rating,
    required String about,
    required String storeLogo,
    required Map<int, String> storeAddress,
    required Map<int, String> storeContact,
    required bool isLive,
    required Map<String, Coupon> coupons,
    required Map<int, String> storeAlerts,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
