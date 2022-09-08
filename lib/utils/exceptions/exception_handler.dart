import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';

class ExceptionHandler {
  static void handleException(error) {
    FydLoader.hideLoading();
    if (error is FirebaseAuthException) {
      // When vid and Otp pair do not match..called via Otp verification method
      if (error.code == 'invalid-verification-code') {
        fydSnack(
            message: 'Invalid OTP entered.', snackposition: SnackPosition.TOP);
      }
      // When PHone no. entered by user is not valid .. called via Phone Auth method..verificationFailed
      if (error.code == 'invalid-phone-number') {
        fydSnack(
            message: "Invalid Phone Number", snackposition: SnackPosition.TOP);
      }
      // Other FirebaseAuth Exception logging with its code
      else {
        log(error.code);
      }
    }
    // Other Exceptions Logging
    else {
      log(error.toString());
    }
  }
}
