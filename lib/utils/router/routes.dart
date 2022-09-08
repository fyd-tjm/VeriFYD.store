import 'package:get/get.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';
import 'package:verifyd_store/presentation/splash/views/splash_screen.dart';
import 'package:verifyd_store/utils/bindings/auth_screen_bindings.dart';

import 'nav_links.dart';

class AppRoutes {
  static String getSplashRoute = NavLinks.SPLASH;
  static String getPhoneAuthRoute = NavLinks.PHONEAUTH;
  static String getHomeRoute = NavLinks.HOME;
  static final pages = [
    GetPage(
      name: NavLinks.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NavLinks.PHONEAUTH,
      page: () => const SplashScreen(),
      binding: AuthScreenBindings(),
    ),
    GetPage(
      name: NavLinks.HOME,
      page: () => const HomeScreen(),
    )
  ];
}
