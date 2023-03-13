import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verifyd_store/00%20ui-core/core/fyd_colors.dart';

//?-----------------------------------------------------------------------------

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 7800), () {
      context.router.replaceNamed('/landing');
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //! Logo-stack
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/main-logo.png',
              width: 180,
              fit: BoxFit.fitWidth,
            ),
          )
              .animate(delay: 6800.ms)
              .fadeOut(duration: 800.ms, curve: Curves.easeInOutBack)
              .scaleXY(duration: 800.ms, curve: Curves.easeInOutBack, end: 0),

          //! Name-stack
          Padding(
            padding: EdgeInsets.only(bottom: 60.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/icons/main-logo-name.svg',
                fit: BoxFit.fitWidth,
                width: 160,
              ),
            ),
          )
              .animate(delay: 1300.ms)
              .fadeIn(duration: 900.ms)
              .move(
                  duration: 900.ms,
                  begin: const Offset(-20, 0),
                  curve: Curves.easeInOutBack)
              .then(delay: 700.ms)
              .shimmer(
                  duration: 2000.ms,
                  color: logoBlueARGB,
                  curve: Curves.fastOutSlowIn)
              .then(delay: 1100.ms)
              .fadeOut(duration: 1000.ms)
              .move(
                  duration: 900.ms,
                  end: const Offset(100, 0),
                  curve: Curves.easeInBack)
        ],
      ),
    );
  }
}
