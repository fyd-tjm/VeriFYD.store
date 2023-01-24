// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/presentation/stores/sub%20views/store/views/store_screen.dart';
// import 'package:verifyd_store/presentation/stores/views/stores_screen.dart';
// import 'package:verifyd_store/utils/router/routes.dart';

// class StoresNavigator extends StatelessWidget {
//   const StoresNavigator({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: Get.nestedKey(AppRoutes.StoresNavigatorKey),
//       onGenerateRoute: (RouteSettings settings) {
//         switch (settings.name) {
//           case AppRoutes.getStoreRoute:
//             return GetPageRoute(
//               settings: settings,
//               page: () => StoreScreen(),
//             );

//           default:
//             return GetPageRoute(
//               settings: settings,
//               page: () => StoresScreen(),
//             );
//         }
//       },
//     );
//   }
// }
