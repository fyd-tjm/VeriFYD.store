import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/data/authentication/phone_authentication_repo.dart';
import 'package:verifyd_store/presentation/authentication/views/otp_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    rxReset();
    super.onInit();
  }

  // late Rx<User?> _user;
  var phone = ''.obs;
  var otp = ''.obs;

// Rx Resseter f()
  void rxReset() {
    phone.value = '';
    otp.value = '';
  }

  Future<void> sendOtp() async {
    PhoneAuthRepo phoneAuthRepo = PhoneAuthRepo(
      auth: auth,
    );
    await phoneAuthRepo.verifyPhoneNumber(phone.value);
  }

  void otpSentCallback() {
    FydLoader.hideLoading();
    Get.to(
      () => const OtpScreen(),
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
    );
  }

  Future<void> verifyOtp() async {
    PhoneAuthRepo phoneAuthRepo = PhoneAuthRepo(
      auth: auth,
    );
    await phoneAuthRepo.verifyOtp(otp.value, PhoneAuthRepo.vId);
  }
}
