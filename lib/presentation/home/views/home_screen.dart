import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:verifyd_store/application/core/auth_checker_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
    );
    return Scaffold(
      backgroundColor: fydPDgrey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AuthCheckerController.fydUser.value?.userName?.getOrCrash() ??
                  'No userName',
              style: const TextStyle(color: Colors.white, fontSize: 36.0),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                FydLoader.showLoading();
                Future<void>.delayed(const Duration(seconds: 1), () {
                  AuthCheckerController.i.userSignOut();
                });
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 40.0,
                color: fydPWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
