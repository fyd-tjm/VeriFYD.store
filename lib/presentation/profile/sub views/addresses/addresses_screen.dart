// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

// import '../../../../aa mock/static_ui.dart';
// import '../../../../utils/router/routes.dart';
// import '../../../core/widgets/fyd_Icon_btn.dart';
// import '../../../core/widgets/fyd_heading_with_back_btn.dart';
// import '../../widgets/address_card.dart';

// class AddressesScreen extends StatelessWidget {
//   const AddressesScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FydPageView(
//         pageViewType: PageViewType.without_Nav_Bar,
//         isScrollable: false,
//         topSheetHeight: 120.h,
//         topSheet: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //! heading with back btn
//             FydHeadingWithBackBtn(
//               heading: 'Address(es)',
//               onBackPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
//             ),
//             FydText.b1black(
//               text: 'Old Delivery Address(es)',
//               weight: FontWeight.bold,
//             ).paddingOnly(bottom: 10.h, left: 30.w),
//           ],
//         ),
//         bottomSheet: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               ListView(
//                 shrinkWrap: true,
//                 children: [
//                   AddressCard(address: MockUi.deliveryAddress),
//                 ],
//               ),
//               Divider(
//                 height: 30.h,
//                 color: fydPWhite,
//               ),
//               //! new address btn
//               FydIconBtn(
//                 fydText: FydText.h3white(text: 'Add New Address'),
//                 onPressed: () => Get.toNamed(
//                   AppRoutes.getNewAddressRoute,
//                   id: AppRoutes.MainNavigatorKey,
//                 ),
//                 color: fydPGrey,
//                 height: 70.h,
//                 icon: Icon(
//                   Icons.add_circle_outline_rounded,
//                   size: 30.sp,
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
