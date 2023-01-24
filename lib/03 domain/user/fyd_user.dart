// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
part 'fyd_user.g.dart';
part 'fyd_user.freezed.dart';

@freezed
@immutable
abstract class FydUser with _$FydUser {
  @JsonSerializable(explicitToJson: true)
  const factory FydUser({
    required String uId,
    required String phone,
    required String name,
    required String email,
    required Map<int, FydAddress> addresses,
  }) = _FydUser;

  factory FydUser.fromJson(Map<String, dynamic> json) =>
      _$FydUserFromJson(json);
}
