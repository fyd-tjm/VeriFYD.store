// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:verifyd_store/aa%20mock/static_ui.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_heading_with_back_btn.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
// import 'package:verifyd_store/presentation/profile/sub%20views/orders/widgets/order_product_tile.dart';
// import 'package:verifyd_store/presentation/profile/sub%20views/orders/widgets/order_tracker.dart';

// import '../../../../../utils/router/routes.dart';

// class OrderScreen extends StatelessWidget {
//   const OrderScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FydPageView(
//         pageViewType: PageViewType.without_Nav_Bar,
//         isScrollable: false,
//         topSheetHeight: 260.h,
//         topSheet: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //! heading with OrderId and backBtn
//             FydHeadingWithBackBtn(
//               heading: 'Order Info',
//               onBackPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
//             ),

//             Column(
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: 'Note : ',
//                     style: GoogleFonts.exo2(
//                         textStyle: TextStyle(
//                             fontSize: body10.fontSize, color: fydSOrange)),
//                     children: <InlineSpan>[
//                       TextSpan(
//                         text:
//                             'Tracking link will be generated once order has been shipped',
//                         style: GoogleFonts.exo2(
//                             textStyle:
//                                 TextStyle(fontSize: 11.sp, color: fydPLgrey)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //! Order Tracker
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     OrderTracker(
//                       activate: 2,
//                     )
//                   ],
//                 ).paddingSymmetric(vertical: 20.h),
//                 //! track / Return btn
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     FydBtn(
//                         height: 30.h,
//                         color: fydPGrey,
//                         width: MediaQuery.of(context).size.width * .4,
//                         fydText: FydText.b2grey(text: 'Track'),
//                         onPressed: () {})
//                   ],
//                 ).paddingOnly(right: 20.w)
//               ],
//             ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)
//           ],
//         ),
//         bottomSheet: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: Column(
//               children: [
//                 //!OrderInfoSection(id,store name,id, date)
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         FydText.h3white(
//                           text: 'Order ${MockUi.orderInfo.elementAt(0)}',
//                           weight: FontWeight.w600,
//                         ),
//                         FydText.b2white(
//                           text: MockUi.orderInfo.elementAt(1),
//                           weight: FontWeight.w600,
//                         ).paddingOnly(top: 10.h),
//                         FydText.b3white(
//                           text: 'storeId: ${MockUi.orderInfo.elementAt(6)}',
//                           weight: FontWeight.w600,
//                         ),
//                       ],
//                     ),
//                     FydText.b3grey(text: MockUi.orderInfo.elementAt(4))
//                   ],
//                 ).paddingOnly(top: 20.h),
//                 //! Products info list
//                 Column(
//                   children: [
//                     OrderProductTile(
//                       prodName: MockUi.cartList[1].elementAt(0),
//                       color: MockUi.cartList[1].elementAt(1),
//                       size: MockUi.cartList[1].elementAt(2),
//                       price: MockUi.cartList[1].elementAt(3),
//                       qty: MockUi.cartList[1].elementAt(4),
//                       prodId: MockUi.cartList[1].elementAt(5),
//                     ),
//                     OrderProductTile(
//                       prodName: MockUi.cartList[1].elementAt(0),
//                       color: MockUi.cartList[1].elementAt(1),
//                       size: MockUi.cartList[1].elementAt(2),
//                       price: MockUi.cartList[1].elementAt(3),
//                       qty: MockUi.cartList[1].elementAt(4),
//                       prodId: MockUi.cartList[1].elementAt(5),
//                     ),
//                   ],
//                 ).paddingOnly(top: 20.h),
//                 //! total section
//                 Column(
//                   children: [
//                     Divider(
//                       color: fydPWhite,
//                       height: 30.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         FydText.b1white(text: 'Sub-Total'),
//                         FydText.b1white(
//                           text: '+ \$ 12.54',
//                           weight: FontWeight.w600,
//                         )
//                       ],
//                     ).paddingOnly(top: 0.h),
//                     //!shipping
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         FydText.b1white(text: 'Shipping'),
//                         FydText.b1white(
//                           text: '+ \$ 12.54',
//                           weight: FontWeight.w600,
//                         )
//                       ],
//                     ).paddingOnly(top: 5.h),
//                     //!Discount
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         FydText.b1white(text: 'Discount'),
//                         FydText.b1white(
//                           text: '- \$ 12.54',
//                           weight: FontWeight.w600,
//                         )
//                       ],
//                     ).paddingOnly(top: 5.h),
//                     Divider(
//                       height: 20.h,
//                       color: fydPWhite,
//                     ),
//                     //!total
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         FydText.b1white(text: 'Total'),
//                         FydText.b1white(
//                           text: '\$ 12.54',
//                           weight: FontWeight.w600,
//                         )
//                       ],
//                     ).paddingOnly(top: 5.h),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
