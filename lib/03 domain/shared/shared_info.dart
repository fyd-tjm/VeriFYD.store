import 'package:freezed_annotation/freezed_annotation.dart';
part 'shared_info.freezed.dart';
part 'shared_info.g.dart';

@freezed
@immutable
abstract class SharedInfo with _$SharedInfo {
  const factory SharedInfo({
    required Map<String, String> categories,
    required double shippingCost,
    required Map<String, String> discount,
    required Map<String, String> banners,
    required Map<String, String> timmings,
    required Map<String, dynamic> support,
    required Map<String, int> liveStores,
    required Map<String, String> images,
  }) = _SharedInfo;

  factory SharedInfo.fromJson(Map<String, dynamic> json) =>
      _$SharedInfoFromJson(json);
}
