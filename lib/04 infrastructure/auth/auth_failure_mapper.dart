import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/03%20domain/auth/00_export_auth_domain.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

class AuthFailureMapper {
  static AuthFailure mapException(error) {
    if (error is FirebaseAuthException) {
      // Analytics logging
      getIt<AnalyticsService>().logAuthException(errorMessage: error.code);
      // error handling
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
      // Analytics logging
      getIt<AnalyticsService>()
          .logAuthException(errorMessage: error.toString());
      return const AuthFailure.unknownError();
    }
  }
}
