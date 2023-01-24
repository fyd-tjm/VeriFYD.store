// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
// import 'package:verifyd_store/presentation/profile/widgets/profile_tile.dart';
// import 'package:verifyd_store/utils/router/routes.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FydPageView(
//       isScrollable: false,
//       topSheetHeight: 300.h,
//       pageViewType: PageViewType.with_Nav_Bar,
//       topSheet: Column(
//         children: [
//           //! ProfileHeading + Edit btn
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   FydText.d2black(text: 'Profile'),
//                 ]),
//               ),
//               Align(
//                 alignment: Alignment.topRight,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       shape: const CircleBorder(),
//                       padding: EdgeInsets.all(8.sp),
//                       primary: fydPDgrey),
//                   child: Icon(
//                     Icons.settings,
//                     size: 30.sp,
//                     color: fydPWhite,
//                   ),
//                   onPressed: () => Get.toNamed(
//                     AppRoutes.getEditProfileRoute,
//                     id: AppRoutes.MainNavigatorKey,
//                   ),
//                 ),
//               ).paddingOnly(right: 15.w),
//             ],
//           ).paddingOnly(top: 10.h),
//           //! Personal-Info-Detail
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 //! Profile-Image-Logo
//                 SizedBox(
//                   height: 100.h,
//                   width: 100.h,
//                   child: Card(
//                     color: fydPDgrey,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.r)),
//                   ),
//                 ),
//                 //! Profile-Name
//                 FydText.h3black(text: 'User\'s name')
//                     .paddingSymmetric(vertical: 5.h),
//                 //! Profile-Phone
//                 FydText.h1black(text: '+91  9690-890-197')
//                     .paddingSymmetric(vertical: 5.h),
//                 //! Profile-email
//                 FydText.b1grey(text: 'user@email.com'),
//               ],
//             ).paddingOnly(bottom: 15.h),
//           ),
//         ],
//       ),
//       bottomSheet: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             //!Address(es)
//             InkWell(
//               onTap: () => Get.toNamed(
//                 AppRoutes.getOrdersRoute,
//                 id: AppRoutes.MainNavigatorKey,
//               ),
//               child: const ProfileTile(
//                   tileColor: fydSBlue,
//                   title: 'Orders',
//                   description: 'your order history',
//                   iconAsset: 'assets/icons/orders.svg'),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             //!Orders
//             InkWell(
//               onTap: () => Get.toNamed(
//                 AppRoutes.getAddressesRoute,
//                 id: AppRoutes.MainNavigatorKey,
//               ),
//               child: const ProfileTile(
//                   tileColor: fydSYellow,
//                   title: 'Address(es)',
//                   description: 'manage your addresses',
//                   iconAsset: 'assets/icons/address.svg'),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             //!Help
//             InkWell(
//               onTap: () => Get.toNamed(
//                 AppRoutes.getHelpRoute,
//                 id: AppRoutes.MainNavigatorKey,
//               ),
//               child: const ProfileTile(
//                   tileColor: fydSPink,
//                   title: 'Help',
//                   description: 'wants to speak with us',
//                   iconAsset: 'assets/icons/help.svg'),
//             ),
//           ],
//         ).paddingSymmetric(vertical: 30.h, horizontal: 15.w),
//       ),
//       //Scrollable
//     );
//   }
// }
