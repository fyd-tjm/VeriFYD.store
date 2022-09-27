import 'dart:developer';

import 'package:fyd_ui/fyd_ui.dart';
import 'package:verifyd_store/domain/auth/auth_failure.dart';
import 'package:verifyd_store/utils/constants/constants.dart';

class AuthFailureHandler {
  static void handleFailure(AuthFailure failure) {
    if (failure == const AuthFailure.invalidPhoneNumber()) {
      fydSnack(message: AuthenticationString.NUMBERVALIDATION);
    }
    if (failure == const AuthFailure.invalidOtpEntered()) {
      fydSnack(message: AuthenticationString.OTPVALIDATION);
    }
    if (failure == const AuthFailure.serverError()) {
      fydSnack(message: 'server error!');
    }
    if (failure == const AuthFailure.firebaseAuthError()) {
      log('firebase Auth Error!');
    }
    if (failure == const AuthFailure.invalidUserNameEntered()) {
      log('enter name under 14 letters long!');
    }
  }
}
