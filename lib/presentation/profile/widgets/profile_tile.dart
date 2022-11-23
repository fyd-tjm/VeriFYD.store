import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String description;
  final String iconAsset;
  final Color tileColor;
  const ProfileTile({
    Key? key,
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: Card(
        color: fydPGrey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! tile Icon
            SizedBox(
              height: 60.h,
              width: 60.h,
              child: Card(
                color: tileColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                child: SvgPicture.asset(
                  iconAsset,
                  fit: BoxFit.contain,
                ).paddingAll(5.r),
              ),
            ).paddingSymmetric(horizontal: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! tile-title
                FydText.h2white(text: title),
                //! tile-description

                FydText.b3grey(text: description)
              ],
            ).paddingOnly(left: 10.w)
          ],
        ),
      ),
    );
  }
}
