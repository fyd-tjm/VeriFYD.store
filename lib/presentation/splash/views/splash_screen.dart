import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/constants/splash_string.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _HomeState();
}

class _HomeState extends State<SplashScreen> {
  Timer? _timer;
  double opacity = 0.0;

  @override
  void initState() {
    // Timer for Next Screen Trigger
    Timer(const Duration(seconds: 8), () {
      Get.offAll(() => const HomeScreen(),
          transition: Transition.cupertino,
          duration: const Duration(milliseconds: 750),
          curve: Curves.easeIn);
    });
// Timers for fyd Logo opacity at bottom-center

    // _timer = Timer(const Duration(seconds: 5), () {
    //   setState(() {
    //     opacity = 1.0;
    //   });
    // });
    // Timer(const Duration(milliseconds: 6500), () {
    //   setState(() {
    //     opacity = 0.0;
    //   });
    // });

    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          children: [
// Typewritter text 'Verifyd.store'
            Center(
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
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
// Bottom Center FYD. Logo text with opacity

            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       AnimatedOpacity(
            //         duration: const Duration(seconds: 2),
            //         curve: Curves.easeInOutCubic,
            //         opacity: opacity,
            //         child: SvgPicture.asset(
            //           "assets/logo/fyd-logo.svg",
            //           height: 40.0,
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20.0,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
