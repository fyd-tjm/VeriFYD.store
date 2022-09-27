import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/utils/bindings/starter_bindings.dart';
import 'package:verifyd_store/utils/router/routes.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);
  // summation of all widgets heigt must be 640-(24) => 616
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'veriFYD.store',
      initialRoute: AppRoutes.getSplashRoute,
      initialBinding: StarterBinding(),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 400),
      getPages: AppRoutes.pages,
    );
  }
}
