import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:verifyd_store/utils/router/routes.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);
  // summation of all widgets heigt must be 640-(24) => 616
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 890),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'veriFYD.store',
            navigatorKey: Get.nestedKey(AppRoutes.MainNavigatorKey),
            // initialRoute: AppRoutes.getStoresRootRoute,
            onGenerateRoute: AppRoutes.mainGenerateRoute,
            // initialBinding: StarterBinding(),
            defaultTransition: Transition.topLevel,
            // transitionDuration: const Duration(milliseconds: 400),
          );
        });
  }
}
