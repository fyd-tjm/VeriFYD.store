import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/config/app_config.dart';
import 'package:verifyd_store/utils/router/routes.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  // summation of all widgets heigt must be 640-(24) => 616
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'veriFYD.store',
      // home: const TestScreen(title: "title"),
      initialRoute: AppRoutes.getSplashRoute,
      getPages: AppRoutes.pages,
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // all the widgets on this screen must have a height summation of 640-(24) => 636
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SvgPicture.asset(
            'assets/logo/fyd-logo.svg',
            height: 40.h,
          ),
        ),
      ),
    );
  }
}
