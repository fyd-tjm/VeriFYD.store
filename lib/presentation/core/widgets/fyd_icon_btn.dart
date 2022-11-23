import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';

class FydIconBtn extends StatelessWidget {
  final FydText fydText;
  final Icon icon;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const FydIconBtn({
    Key? key,
    required this.fydText,
    required this.onPressed,
    this.color = fydPDgrey,
    this.textColor = fydPWhite,
    this.height = 55,
    this.width = double.infinity,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: color, // background
          onPrimary: textColor, // foreground
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: onPressed,
        icon: icon,
        label: fydText,
      ),
    );
  }
}
