import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_user.freezed.dart';

@immutable
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String userId,
    required String userPhone,
  }) = _AuthUser;
}
