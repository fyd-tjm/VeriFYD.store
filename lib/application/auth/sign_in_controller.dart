import 'dart:async';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/application/auth/auth_failure_handler.dart';
import 'package:verifyd_store/domain/auth/i_auth_facade.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/constants/constants.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router/routes.dart';

class SignInController extends GetxController {
  static SignInController i = Get.find();
  final IAuthFacade iAuthFacade = getIt.get<IAuthFacade>();

  final Rx<PhoneNumber> phoneNumber = PhoneNumber('').obs;
  final Rx<Otp> otp = Otp('').obs;
  final Rx<UserName> userName = UserName('').obs;
  late StreamSubscription<bool> _streamSubscription;

//?-------------------------Helper-Methods--------------------------------------

  void addCodeSentStreamSubscription(Stream<bool> stream) {
    _streamSubscription = stream.listen((event) {
      _navigationToOtp(event);
    });
  }

  void _navigationToOtp(bool isCodeSent) {
    if (isCodeSent) {
      FydLoader.hideLoading();
      cancelCodeSentStream();
      Get.toNamed(AppRoutes.getOtpAuthRoute);
    }
  }

  void cancelCodeSentStream() {
    _streamSubscription.cancel();
  }

//?-----------------------------Helper-Methods----------------------------------

//!------------------------------Core-Methods-----------------------------------

//! @ SendOTP
  void sendOtpPressed() async {
    if (phoneNumber.value.isValid()) {
      FydLoader.showLoading();
      // 2) create new Stream via authfacade
      // 3) subscribe to the new stream
      final codeStream = iAuthFacade.isCodeSent();
      addCodeSentStreamSubscription(codeStream);

      final result = await iAuthFacade.sendOtp(phoneNumber: phoneNumber.value);

      result.fold(
        (failure) {
          FydLoader.hideLoading();
          cancelCodeSentStream();
          AuthFailureHandler.handleFailure(failure);
        },
        (unit) => null,
      );
    } else {
      fydSnack(
        message: AuthenticationString.NUMBERVALIDATION,
        snackposition: SnackPosition.TOP,
      );
    }
  }

//! @ ResendOTP
  void resendOtpPressed() async {
    final result = await iAuthFacade.sendOtp(phoneNumber: phoneNumber.value);
    result.fold(
      (failure) {
        cancelCodeSentStream();
        AuthFailureHandler.handleFailure(failure);
      },
      (unit) => null,
    );
  }

//! @ ConfirmOTP
  void confirmOtpPressed() async {
    if (otp.value.isValid()) {
      FydLoader.showLoading();
      final result = await iAuthFacade.confirmOtp(otp: otp.value);
      result.fold(
        (failure) => AuthFailureHandler.handleFailure(failure),
        (unit) => unit,
      );
    } else {
      fydSnack(
        message: AuthenticationString.OTPVALIDATION,
        snackposition: SnackPosition.TOP,
      );
    }
  }

//! @ AddUserName via finish setup btn
  void finishSetupPressed() async {
    if (userName.value.getOrCrash() != '') {
      FydLoader.showLoading();
      final result = await iAuthFacade.addUserName(userName: userName.value);
      result.fold((failure) => AuthFailureHandler.handleFailure(failure),
          (unit) => unit);
    } else {
      fydSnack(
        message: AuthenticationString.USERNAMEVALIDATION,
        snackposition: SnackPosition.TOP,
      );
    }
  }
}


  

//!------------------------------Core-Methods-----------------------------------
