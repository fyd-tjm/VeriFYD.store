import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/domain/auth/auth_failure.dart';

class AuthFailureMapper {
  static AuthFailure failureMapper(error) {
    if (error is FirebaseAuthException) {
      if (error.code == 'invalid-verification-code') {
        return (const AuthFailure.invalidOtpEntered());
      }

      if (error.code == 'invalid-phone-number') {
        return (const AuthFailure.invalidPhoneNumber());
      } else {
        return (const AuthFailure.firebaseAuthError());
      }
    }
    // Other Exceptions Logging
    else {
      return const AuthFailure.serverError();
    }
  }
}
