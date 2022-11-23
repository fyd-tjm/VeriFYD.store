import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/cart/views/cart_screen.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';
import 'package:verifyd_store/presentation/profile/views/profile_screen.dart';
import 'package:verifyd_store/utils/router/routes.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppRoutes.MainNavigatorKey),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AppRoutes.getCartRoute:
            return GetPageRoute(
              settings: settings,
              page: () => const CartScreen(),
            );
          case AppRoutes.getProfileRoute:
            return GetPageRoute(
              settings: settings,
              page: () => const ProfileScreen(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () => const HomeScreen(),
            );
        }
      },
    );
  }
}
