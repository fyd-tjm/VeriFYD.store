import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProductTile extends StatelessWidget {
  final String prodName;
  final String color;
  final String size;
  final double price;
  final int qty;
  const CartProductTile({
    Key? key,
    required this.prodName,
    required this.color,
    required this.size,
    required this.price,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity, //400.w
      child: Card(
        color: fydPWhite,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //!Product-Image (-80.w-20.w)
            SizedBox(
              height: 80.w,
              width: 80.w,
              child: Card(
                color: fydSBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ).paddingSymmetric(horizontal: 8.w, vertical: 5.w),
            //! Product-Detail (-160.w)
            SizedBox(
              width: 160.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!product-Name
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      prodName,
                      style: GoogleFonts.exo2(
                          color: fydPDgrey,
                          fontSize: body16.fontSize,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //!Product color;size;other
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      '$color : $size : other',
                      style: GoogleFonts.exo2(
                          color: fydPLgrey,
                          fontSize: body14.fontSize,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //! Product cost
                  FydText.h3black(text: '\$${price * qty}')
                ],
              ).paddingSymmetric(vertical: 8.h),
            ),
            const Spacer(),
            //! Qty-Editor (-110.w)
            Row(mainAxisSize: MainAxisSize.min, children: [
              //! Decreament-btn
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.remove_circle_outline_sharp),
                color: fydPDgrey,
                iconSize: 30.sp,
              ),
              //! QTY
              FydText.b1black(
                text: '$qty',
                weight: FontWeight.w600,
              ).paddingSymmetric(horizontal: 8.w),
              //! Increament-btn
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: const Icon(Icons.add_circle_sharp),
                color: fydPDgrey,
                iconSize: 30.sp,
              ),
            ]).paddingOnly(right: 10.w),
          ],
        ),
      ),
    );
  }
}
