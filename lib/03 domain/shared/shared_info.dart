import 'package:freezed_annotation/freezed_annotation.dart';
part 'shared_info.freezed.dart';
part 'shared_info.g.dart';

@freezed
@immutable
abstract class SharedInfo with _$SharedInfo {
  const factory SharedInfo({
    required Map<String, String> categories,
    required double shippingCost,
    required int totalOrders,
    required int cartLimit,
    required Map<String, int> liveStores,
    required Map<String, String> timmings,
    required Map<String, String> images,
    required Map<String, String> support,
    required Map<int, String> banners,
    required Map<String, String> offers,
  }) = _SharedInfo;

  factory SharedInfo.fromJson(Map<String, dynamic> json) =>
      _$SharedInfoFromJson(json);
}
