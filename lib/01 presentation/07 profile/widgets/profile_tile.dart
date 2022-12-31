//! profileTile
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String description;
  final String iconAsset;
  final Color iconColor;
  final VoidCallback onPressed;
  const ProfileTile({
    Key? key,
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.iconColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      height: 70.h,
      color: fydPGrey,
      onPressed: onPressed,
      widget: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // tile Icon
          Padding(
            padding: EdgeInsets.only(left: 0.w, right: 15.w),
            child: SizedBox(
              height: 60.h,
              width: 60.h,
              child: Card(
                color: iconColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: SvgPicture.asset(
                    iconAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tile-title
              FydText.h2white(text: title),
              // tile-description
              FydText.b3grey(text: description)
            ],
          )
        ],
      ),
    );
  }
}
