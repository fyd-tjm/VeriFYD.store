import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/model/fyd_user_model.dart';
import 'package:verifyd_store/presentation/authentication/views/phone_auth_screen.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';
import 'package:verifyd_store/utils/bindings/auth_screen_bindings.dart';

class AuthChecker extends GetxController {
  static AuthChecker instance = Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  static late FydUser fydUser;

  late Rx<User?> _user;

  @override
  void onInit() {
    log('checking authentication');
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    //worker function
    ever(_user, _initialScreen);
    super.onInit();
  }

  _initialScreen(User? user) {
// To Display login screen if no current user
    if (user == null) {
      FydLoader.hideLoading();
      Get.offAll(() => PhoneAuthScreen(),
          binding: AuthScreenBindings(),
          transition: Transition.topLevel,
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeIn);
    }
// To Display Home screen if there is  current user
    else {
      FydLoader.hideLoading();
      Get.offAll(() => const HomeScreen(),
          transition: Transition.topLevel,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn);
    }
  }

  void _creatingFydUser(User user) {
    fydUser = FydUser(
      uid: user.uid,
      phone: user.phoneNumber!,
    );
  }
}
