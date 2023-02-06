import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/utils/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 6600), () {
      context.router.replaceNamed(Rn.landing);
    });
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Image.asset(
              'assets/gifs/splash.gif',
              filterQuality: FilterQuality.high,
              // scale: 4,
              height: 300,
              fit: BoxFit.fitHeight,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
        ),
      ),
    );
  }
}
