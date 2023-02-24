import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class FydAddress implements _$FydAddress {
  const FydAddress._();
  const factory FydAddress({
    required String name,
    required String phone,
    required String email,
    required String line1,
    required String line2,
    required String landmark,
    required String city,
    required String state,
    required int pincode,
  }) = _FydAddress;

  factory FydAddress.fromJson(Map<String, dynamic> json) =>
      _$FydAddressFromJson(json);

  @override
  String toString() {
    if (landmark.isEmpty) {
      return '$line1, $line2, $city, $state, $pincode';
    } else {
      return '$line1, $line2, $landmark, $city, $state, $pincode';
    }
  }
}
