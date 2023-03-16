// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

enum ViewType { with_Nav_Bar, without_Nav_Bar }

//! navBar(65.5)  +  topandbottomColumn (772) <  838.335
class FydView extends StatelessWidget {
  final BouncingScrollPhysics bouncingScrollPhysics =
      const BouncingScrollPhysics();

  final ViewType pageViewType;
  final bool isScrollable;
  final double topSheetHeight;
  final Widget topSheet;
  final Widget bottomSheet;
  final Color topSheetColor;

  const FydView({
    Key? key,
    required this.pageViewType,
    required this.isScrollable,
    required this.topSheetHeight,
    required this.topSheet,
    required this.bottomSheet,
    this.topSheetColor = fydPwhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fydPblack,
      height: (pageViewType == ViewType.with_Nav_Bar) ? 772.h : 838.h,
      child: (isScrollable)
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              // reverse: true,
              child: _topandbottomColumn(),
            )
          : _topandbottomColumn(),
    );
  }

  Widget _topandbottomColumn() {
    return Column(
      children: [
        //! top-sheet
        Container(
            height: topSheetHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: topSheetColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
              ),
            ),
            child: topSheet),

        //! bottom-sheet
        // ignore: sized_box_for_whitespace
        SizedBox(
            height: ((pageViewType == ViewType.with_Nav_Bar)
                ? 772.h - topSheetHeight
                : 838.h - topSheetHeight),
            child: bottomSheet)
      ],
    );
  }
}
