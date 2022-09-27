import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/authentication/views/name_screen.dart';
import 'package:verifyd_store/presentation/authentication/views/otp_screen.dart';
import 'package:verifyd_store/presentation/authentication/views/phone_auth_screen.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';
import 'package:verifyd_store/presentation/splash/views/splash_screen.dart';
import 'package:verifyd_store/utils/bindings/auth_screen_bindings.dart';

import 'nav_links.dart';

class AppRoutes {
  static String getSplashRoute = NavLinks.SPLASH;
  static String getPhoneAuthRoute = NavLinks.PHONEAUTH;
  static String getOtpAuthRoute = NavLinks.OTPAUTH;
  static String getNameAuthRoute = NavLinks.NAMEAUTH;
  static String getHomeRoute = NavLinks.HOME;
  static final pages = [
    GetPage(
      name: NavLinks.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NavLinks.PHONEAUTH,
      page: () => const PhoneAuthScreen(),
      binding: AuthScreenBindings(),
      transition: Transition.topLevel,
      // curve: Curves.easeIn,
    ),
    GetPage(
      name: NavLinks.OTPAUTH,
      page: () => const OtpScreen(),
      transition: Transition.rightToLeft,
      // curve: Curves.easeIn,
    ),
    GetPage(
      name: NavLinks.NAMEAUTH,
      page: () => const NameScreen(),
      binding: AuthScreenBindings(),
      transition: Transition.rightToLeft,
      // curve: Curves.easeIn,
    ),
    GetPage(
      name: NavLinks.HOME,
      page: () => const HomeScreen(),
    )
  ];
}


          // transition: Transition.topLevel, curve: Curves.easeIn,
          // 
          // duration: const Duration(milliseconds: 650),
         