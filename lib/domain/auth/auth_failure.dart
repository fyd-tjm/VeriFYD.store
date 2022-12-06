import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
@immutable
abstract class AuthFailure with _$AuthFailure {
  // invalid-phone-number
  const factory AuthFailure.invalidPhoneNumber() = InvalidPhoneNumber;
  // invalid-verification-code
  // invalid-verification-id
  const factory AuthFailure.invalidOtpEntered() = InvalidOtpEntered;
  // captcha-check-failed
  // quota-exceeded
  const factory AuthFailure.sessionExpired() = SessionExpired;
  // user-disabled
  const factory AuthFailure.userDisabled() = UserDisabled;
  // other firebaseAuth
  const factory AuthFailure.tooManyRequests() = TooManyRequests;
  const factory AuthFailure.serverError() = ServerError;
  // in case its not firebaseAuth Exception
  const factory AuthFailure.unknownError() = UnknownError;
}
