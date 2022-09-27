import 'dart:async';
import 'package:get/get.dart';

class AuthUiController extends GetxController {
  static AuthUiController instance = Get.find();
  final phoneNo = ''.obs;
  final otp = ''.obs;
  final hintText = "(0000)-000-000";
  final otpText = 'X-X-X-X-X-X';
  final timeleft = 0.obs;
  final timerOn = false.obs;

  // to close timer if running while navigating

  @override
  void onInit() {
    rxReset();
    super.onInit();
  }

  @override
  void dispose() {
    rxReset();
    super.dispose();
  }

  // Rx Resseter f()
  void rxReset() {
    otp.value = '';
    timerOn.value = false;
  }

  void resendTimer(int time) {
    timerOn.value = true;
    timeleft.value = time;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // Update time on screen via controller
        timeleft.value--;
        if (timeleft.value <= 0 || timerOn.value == false) {
          timer.cancel();
          timerOn.value = false;
        }
      },
    );
  }
}
