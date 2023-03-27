import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/03%20domain/auth/00_export_auth_domain.dart';

class AuthFailureMapper {
  static AuthFailure mapException(error) {
    if (error is FirebaseAuthException) {
      if (error.code == 'invalid-phone-number') {
        return (const AuthFailure.invalidPhoneNumber());
      } else if (error.code == 'invalid-verification-code' ||
          error.code == 'invalid-verification-id') {
        return (const AuthFailure.invalidOtpEntered());
      } else if (error.code == 'user-disabled') {
        return (const AuthFailure.userDisabled());
      } else if (error.code == 'captcha-check-failed' ||
          error.code == 'quota-exceeded') {
        return (const AuthFailure.sessionExpired());
      } else {
        return (const AuthFailure.serverError());
      }
    } else {
      return const AuthFailure.unknownError();
    }
  }
}
