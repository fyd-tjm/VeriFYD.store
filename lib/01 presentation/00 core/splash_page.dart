import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/utils/constants/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      context.router.replaceNamed('/landing');
    });
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SizedBox(
              height: 70,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    SplashString.CENTERLOGO,
                    textStyle: const TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
