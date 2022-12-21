//! fyd-app-bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
