import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';

class OrderProductTile extends StatelessWidget {
  final String prodId;
  final String prodName;
  final String color;
  final String size;
  final double price;
  final int qty;
  const OrderProductTile({
    Key? key,
    required this.prodName,
    required this.color,
    required this.size,
    required this.price,
    required this.qty,
    required this.prodId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity, //400.w
      child: Card(
        color: fydPGrey,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! product-id
                  FydText.b2white(text: 'pId: $prodId'),
                  //!product-Name
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      prodName,
                      style: GoogleFonts.exo2(
                          color: fydPWhite,
                          fontSize: body12.fontSize,
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
                          color: fydPWhite,
                          fontSize: body12.fontSize,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 8.h),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.b4white(
                      text: '\u{20B9}$price', weight: FontWeight.bold),
                  FydText.b4white(
                      text: qty.toString(), weight: FontWeight.bold),
                  FydText.b4white(
                    text: '\u{20B9}${qty * price.toDouble()}',
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
