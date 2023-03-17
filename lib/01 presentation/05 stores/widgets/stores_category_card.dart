import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

//?-----------------------------------------------------------------------------

class StoresCategoryCard extends StatelessWidget {
  const StoresCategoryCard({
    Key? key,
    required this.svgAsset,
    required this.title,
    required this.color,
    required this.selectedTitle,
    required this.onPressed,
  }) : super(key: key);

  final String svgAsset;
  final String title;
  final Color color;
  final String? selectedTitle;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    final isEnabled =
        (selectedTitle == null) ? false : (selectedTitle == title);
    return SizedBox(
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.heavyImpact();
              onPressed(title);
            },
            child: SizedBox(
              height: 70.h,
              width: 70.h,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                elevation: 15.0,
                shadowColor: isEnabled ? fydBblue : null,
                color: fydPblack,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: SvgPicture.asset(
                    svgAsset,
                    color: color,
                  ),
                ),
              ),
            ),
          ),
          FydText.b4black(
            text: title,
            size: isEnabled ? 14 : 13,
            weight: FontWeight.w700,
          )
        ],
      ),
    );
  }
}
