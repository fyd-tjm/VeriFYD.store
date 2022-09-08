import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/controllers/controllers.dart';
import 'package:verifyd_store/utils/exceptions/exception_handler.dart';

class PhoneAuthRepo extends Equatable {
  final FirebaseAuth auth;
  static String vId = '';

  const PhoneAuthRepo({
    required this.auth,
  });

  @override
  List<Object?> get props => [
        auth,
      ];
// Firebase Authenticatio method for Phone Auth
// Return Integer code with 0(false) or 1(true)
  Future<void> verifyPhoneNumber(String phone) async {
    try {
      PhoneAuthRepo.vId = '';
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phone',
        timeout: const Duration(milliseconds: 60000),
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificaitonfailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      log(e.code);
    }
  }

// Function Callback when an SMS is auto-retrieved or the phone number has been instantly verified
  void _verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      ExceptionHandler.handleException(e);
    }
  }

// Function Callback when an error occurred during phone number verification
  void _verificaitonfailed(FirebaseAuthException e) {
    ExceptionHandler.handleException(e);
  }

// Function Callback after code is sent and vid and token is generated
  void _codeSent(String verificationId, int? resendToken) {
    vId = verificationId;
    log('code is sent');
    AuthController.instance.otpSentCallback();
  }

// Method Call for Verifying the Otp
// Return Integer code with 0(false) or 1(true)
  Future<void> verifyOtp(String otp, String vid) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: vid, smsCode: otp);
    try {
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      ExceptionHandler.handleException(e);
    }
  }
}
