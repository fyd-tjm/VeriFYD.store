import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fyd_colors.dart';
import 'fyd_text.dart';

class FydBtn extends StatelessWidget {
  final FydText? fydText;
  final Widget? widget;
  final Color color;
  final Color fillColor;
  final Color splashColor;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final bool isFilled;

  const FydBtn({
    Key? key,
    this.fydText,
    required this.onPressed,
    this.widget,
    this.color = fydSblack,
    this.fillColor = fydPwhite,
    this.height = 55,
    this.width = double.infinity,
    this.isFilled = true,
    this.splashColor = fydPwhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (isFilled) ? color : fillColor,
          foregroundColor: splashColor,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              side: (isFilled)
                  ? BorderSide.none
                  : BorderSide(color: color, width: 2.0),
              borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: () {
          HapticFeedback.mediumImpact();
          onPressed();
        },
        child: fydText ?? widget,
      ),
    );
  }
}
