import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_colors.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';

//?-----------------------------------------------------------------------------

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      // navigate to landing page
      context.router.replaceNamed(Rn.landing);
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! Name-stack
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AssetHelper.svg_splash_name,
                fit: BoxFit.fitWidth,
                width: 160,
              ),
            )
                .animate(
                  delay: 400.ms,
                )
                .fadeIn(duration: 400.ms)
                .move(
                    duration: 500.ms,
                    begin: const Offset(-20, 0),
                    curve: Curves.easeInOutBack)
                .then(delay: 200.ms)
                .shimmer(
                    duration: 3000.ms,
                    color: fydBblue,
                    curve: Curves.fastOutSlowIn)
                .then(delay: 300.ms)
                .fadeOut(duration: 800.ms, curve: Curves.easeInOutBack)
                .scaleXY(duration: 800.ms, curve: Curves.easeInOutBack, end: 0),
          ],
        ),
      ),
    );
  }
}
