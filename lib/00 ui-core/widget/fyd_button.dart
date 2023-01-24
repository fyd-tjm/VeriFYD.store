import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/core/fyd_colors.dart';
import 'package:verifyd_store/00%20ui-core/widget/fyd_text.dart';

class FydBtn extends StatelessWidget {
  final FydText? fydText;
  final Widget? widget;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final bool isFilled;

  const FydBtn({
    Key? key,
    this.fydText,
    required this.onPressed,
    this.widget,
    this.color = fydPDgrey,
    this.textColor = fydPWhite,
    this.height = 55,
    this.width = double.infinity,
    this.isFilled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isFilled) ? color : fydPWhite, // background
          onPrimary: textColor, // foreground
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              side: (isFilled)
                  ? BorderSide.none
                  : BorderSide(color: color, width: 2.0),
              borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: onPressed,
        child: fydText ?? widget,
      ),
    );
  }
}
