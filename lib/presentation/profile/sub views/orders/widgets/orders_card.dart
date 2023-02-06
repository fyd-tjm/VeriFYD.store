import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class OrdersCard extends StatelessWidget {
  final List<String> orderInfo;
  const OrdersCard({Key? key, required this.orderInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      // child: Card(
      //   color: fydPGrey,
      //   shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 FydText.b1white(
      //                   text: 'Order ${orderInfo.elementAt(0)}',
      //                   weight: FontWeight.w600,
      //                 ),
      //                 FydText.b1white(
      //                   text: orderInfo.elementAt(1),
      //                   weight: FontWeight.w600,
      //                 ),
      //                 FydText.b3white(
      //                   text: '${orderInfo.elementAt(2)} Items',
      //                   weight: FontWeight.w600,
      //                 ),
      //               ],
      //             ),
      //             FydText.b4grey(text: orderInfo.elementAt(4))
      //           ],
      //         ),
      //         Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 FydText.b1white(
      //                     text: '\u{20B9} ${orderInfo.elementAt(3)}',
      //                     weight: FontWeight.bold)
      //               ],
      //             ),
      //             FydText.b4white(
      //               text: orderInfo.elementAt(5),
      //               weight: FontWeight.bold,
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
