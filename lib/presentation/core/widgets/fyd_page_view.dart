import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'fyd_nav_bar.dart';

// ignore: constant_identifier_names
enum PageViewType { with_Nav_Bar, without_Nav_Bar }

//! navBar(80)  +  topandbottomColumn (758.3) <  838.335
class FydPageView extends StatelessWidget {
  final BouncingScrollPhysics bouncingScrollPhysics =
      const BouncingScrollPhysics();

  final PageViewType pageViewType;
  final bool isScrollable;
  final double topSheetHeight;
  final Widget topSheet;
  final Widget bottomSheet;
  final Color topSheetColor;

  const FydPageView({
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
    return Scaffold(
      backgroundColor: fydPblack,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
//! col-1
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! col-2
            SizedBox(
              height:
                  (pageViewType == PageViewType.with_Nav_Bar) ? 758.3.h : 800.h,
              child: (isScrollable)
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      // reverse: true,
                      child: _topandbottomColumn(
                        pageViewType: pageViewType,
                        topSheetHeight: topSheetHeight,
                        topSheet: topSheet,
                        bottomSheet: bottomSheet,
                        topSheetColor: topSheetColor,
                      ),
                    )
                  : _topandbottomColumn(
                      pageViewType: pageViewType,
                      topSheetHeight: topSheetHeight,
                      topSheet: topSheet,
                      bottomSheet: bottomSheet,
                      topSheetColor: topSheetColor,
                    ),
            ),
            //! fyd-nav-bar
            (pageViewType == PageViewType.with_Nav_Bar)
                ? const FydNavBar()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _topandbottomColumn extends StatelessWidget {
  const _topandbottomColumn({
    Key? key,
    required this.topSheetHeight,
    required this.topSheet,
    required this.bottomSheet,
    this.topSheetColor = fydPwhite,
    required this.pageViewType,
  }) : super(key: key);
  final PageViewType pageViewType;
  final double topSheetHeight;
  final Widget topSheet;
  final Widget bottomSheet;
  final Color topSheetColor;

  @override
  Widget build(BuildContext context) {
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
            height: ((pageViewType == PageViewType.with_Nav_Bar)
                ? 758.3.h - topSheetHeight
                : 800.h - topSheetHeight),
            child: bottomSheet)
      ],
    );
  }
}
