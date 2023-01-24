// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
// import 'package:get/get.dart';
// import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

// import '../../../../utils/router/routes.dart';

// class PaymentScreen extends StatelessWidget {
//   const PaymentScreen({Key? key}) : super(key: key);

//   //! Widgets {PaymentSelectionCard}
//   @override
//   Widget build(BuildContext context) {
//     return FydPageView(
//         pageViewType: PageViewType.without_Nav_Bar,
//         isScrollable: false,
//         topSheetHeight: 200.h,
//         topSheet: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 //! payment Heading
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         FydText.d1black(text: 'Payment'),
//                       ]),
//                 ),
//                 //! back btn
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: Size.zero,
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.r)),
//                         primary: fydPDgrey),
//                     child: Icon(
//                       Icons.arrow_back_ios_new_rounded,
//                       size: 25.sp,
//                     ).paddingAll(6.sp),
//                     onPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
//                   ),
//                 ).paddingOnly(left: 15.w),
//               ],
//             ).paddingOnly(top: 10.h),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 //! payable amount subHeading
//                 //! Amount
//                 FydText.b3grey(text: 'Payable amount'),
//                 FydText.d1black(
//                   text: '\u{20B9} 534.93',
//                   color: fydSOrange,
//                 )
//               ],
//             ).paddingOnly(bottom: 30.h)
//           ],
//         ),
//         bottomSheet: Padding(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 50.h),
//                 child: Column(
//                   //! Upi Selection

//                   children: [
//                     PaymentSelectionCard(
//                       onSelect: (s) {},
//                       title: 'UPI',
//                     ),
//                     FydText.b3grey(text: '(or)')
//                         .paddingSymmetric(vertical: 20.h),
//                     //! Cod Selection
//                     PaymentSelectionCard(
//                       onSelect: (s) {},
//                       title: 'Cash On Delivery',
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         FydText.b3grey(text: '\u{20B9}100 extra for cod')
//                             .paddingOnly(right: 10.w)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               //! Proceed btn
//               FydBtn(
//                 color: fydPGrey,
//                 height: 60.h,
//                 fydText: FydText.h2white(text: 'Proceed'),
//                 onPressed: () => Get.offAndToNamed(
//                     AppRoutes.getConfirmationRoute,
//                     id: AppRoutes.MainNavigatorKey),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// class PaymentSelectionCard extends StatefulWidget {
//   final String title;
//   final Function(String) onSelect;
//   const PaymentSelectionCard(
//       {Key? key, required this.onSelect, required this.title})
//       : super(key: key);

//   @override
//   State<PaymentSelectionCard> createState() => _PaymentSelectionCardState();
// }

// class _PaymentSelectionCardState extends State<PaymentSelectionCard> {
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80.h,
//       width: double.infinity,
//       child: Card(
//         color: fydPGrey,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     //! payment Heading
//                     Align(
//                       alignment: Alignment.center,
//                       child: FydText.h3white(text: widget.title),
//                     ),
//                     //! back btn
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Radio(
//                             value: isSelected,
//                             groupValue: true,
//                             onChanged: (value) {
//                               setState(() {
//                                 isSelected = !isSelected;
//                               });
//                               widget.onSelect;
//                             },
//                             toggleable: true,
//                             fillColor: MaterialStateColor.resolveWith(
//                                 (states) => fydSOrange),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
