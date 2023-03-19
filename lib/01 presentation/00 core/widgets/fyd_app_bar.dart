//! fyd-app-bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydAppBar extends StatelessWidget {
  const FydAppBar({
    Key? key,
    this.leading,
    this.trailing,
    required this.main,
  }) : super(key: key);
  final Widget? leading;
  final Widget? trailing;
  final Widget main;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // leading
          SizedBox(width: 90.w, child: leading),
          // main
          SizedBox(
            width: 220.w,
            child: main,
          ),
          // trailing
          SizedBox(width: 90.w, child: trailing),
        ],
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class AppBarBtn extends StatelessWidget {
  const AppBarBtn(
      {super.key,
      required this.iconData,
      this.iconColor = fydBbluegrey,
      this.bgColor = fydSblack,
      required this.onPressed,
      this.iconSize = 25,
      this.alignment = Alignment.center,
      this.padding = const EdgeInsets.all(5)});

  const AppBarBtn.back({
    super.key,
    this.iconData = FontAwesomeIcons.arrowLeftLong,
    this.iconColor = fydPblack,
    this.bgColor = fydPwhite,
    this.iconSize = 20,
    this.padding = const EdgeInsets.all(10.0),
    this.alignment = Alignment.center,
    required this.onPressed,
  });
  const AppBarBtn.close({
    super.key,
    this.iconData = FontAwesomeIcons.xmark,
    this.iconColor = fydBbluegrey,
    this.bgColor = fydPblack,
    this.iconSize = 22,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    required this.onPressed,
  });
  final IconData iconData;
  final Color iconColor;
  final Color bgColor;
  final double iconSize;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            primary: bgColor),
        // ignore: sort_child_properties_last
        child: Padding(
          padding: padding,
          child: Icon(iconData, size: iconSize, color: iconColor),
        ),

        onPressed: onPressed,
      ),
    );
  }
}
