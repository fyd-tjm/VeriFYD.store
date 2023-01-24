// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/utils/constants/constants.dart';
// import 'package:verifyd_store/utils/router/routes.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 8), () {
//       Get.offAllNamed(AppRoutes.getMainRoute, id: AppRoutes.MainNavigatorKey);
//     });
//     return Scaffold(
//       backgroundColor: const Color(0xff000000),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Center(
//           child: SizedBox(
//             height: 70,
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 TypewriterAnimatedText(
//                   SplashString.CENTERLOGO,
//                   textStyle: const TextStyle(
//                     fontSize: 42.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   speed: const Duration(milliseconds: 90),
//                 ),
//               ],
//               totalRepeatCount: 1,
//               pause: const Duration(milliseconds: 1000),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
