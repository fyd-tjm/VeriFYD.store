import 'package:freezed_annotation/freezed_annotation.dart';
part 'fyd_user.g.dart';
part 'fyd_user.freezed.dart';

@freezed
@immutable
abstract class FydUser with _$FydUser {
  const factory FydUser({
    required String uId,
    required String phone,
    required String name,
  }) = _FydUser;

  factory FydUser.fromJson(Map<String, dynamic> json) =>
      _$FydUserFromJson(json);
}
