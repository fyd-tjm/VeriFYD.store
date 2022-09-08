import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/constants/splash_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _HomeState();
}

class _HomeState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    // Timer for Next Screen Trigger
    Timer(const Duration(seconds: 8), () {
      // Get.offAll(() => const HomeScreen(),
      //     transition: Transition.cupertino,
      //     duration: const Duration(milliseconds: 750),
      //     curve: Curves.easeIn);
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SizedBox(
            height: 70,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  SplashString.CENTERLOGO,
                  textStyle: const TextStyle(
                    fontSize: 42.0,
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
    );
  }
}
