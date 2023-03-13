import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';
part 'tester.freezed.dart';
part 'tester.g.dart';

@freezed
class Tester with _$Tester {
  @JsonSerializable(explicitToJson: true)
  const factory Tester({
    required int index,
    required Map<String, Coupon> coupons,
  }) = _Tester;
  factory Tester.fromJson(Map<String, dynamic> json) => _$TesterFromJson(json);
}
