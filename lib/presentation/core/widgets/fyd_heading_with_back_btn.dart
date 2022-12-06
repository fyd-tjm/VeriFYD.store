import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';

class FydHeadingWithBackBtn extends StatelessWidget {
  final String heading;
  final VoidCallback onBackPressed;
  const FydHeadingWithBackBtn({
    Key? key,
    required this.heading,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //! Heading
        Align(
          alignment: Alignment.topCenter,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FydText.d1black(text: '  $heading'),
          ]),
        ),
        //! back btn
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                primary: fydPDgrey),
            onPressed: onBackPressed,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25.sp,
            ).paddingAll(6.sp),
          ),
        ).paddingOnly(left: 15.w),
      ],
    ).paddingOnly(top: 10.h);
  }
}
