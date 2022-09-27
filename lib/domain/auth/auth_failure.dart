import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
@immutable
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidPhoneNumber() = InvalidPhoneNumber;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.invalidOtpEntered() = InvalidOtpEntered;
  const factory AuthFailure.invalidUserNameEntered() = InvalidUserNameEntered;
  const factory AuthFailure.firebaseAuthError() = FirebaseAuthError;
}
