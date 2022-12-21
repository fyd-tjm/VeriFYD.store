import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../00 ui-core/ui_exports.dart';

class FydCategoryCard extends StatelessWidget {
  const FydCategoryCard({
    Key? key,
    required this.svgAsset,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String svgAsset;
  final String title;
  final Color color;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                elevation: 10.0,
                color: color,
                child: Padding(
                  padding: EdgeInsets.all(5.r),
                  child: SvgPicture.asset(
                    svgAsset,
                  ),
                ),
              ),
            ),
          ),
          FydText.b4black(
            text: title,
            weight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
