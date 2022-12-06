import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:group_button/group_button.dart';

class ProductSizeGroupBtn extends StatelessWidget {
  final GroupButtonController controller;
  final EdgeInsets hvPadding;
  final List<String> sizeList;

  const ProductSizeGroupBtn(
      {Key? key,
      required this.controller,
      required this.hvPadding,
      required this.sizeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupButton(
      controller: controller,
      buttons: sizeList,
      options: GroupButtonOptions(
        selectedShadow: const [],
        unselectedShadow: const [],
        selectedColor: fydSOrange,
        unselectedColor: fydPGrey,
        unselectedTextStyle: TextStyle(
          fontSize: heading22.fontSize,
          color: fydPWhite,
        ),
        selectedTextStyle: TextStyle(
          fontSize: heading22.fontSize,
          color: fydPWhite,
        ),
        borderRadius: BorderRadius.circular(10.r),
        spacing: hvPadding.horizontal,
        runSpacing: hvPadding.vertical,
        groupingType: GroupingType.wrap,
        direction: Axis.horizontal,
        buttonHeight: 50.h,
        buttonWidth: 70.w,
        mainGroupAlignment: MainGroupAlignment.start,
        crossGroupAlignment: CrossGroupAlignment.center,
        groupRunAlignment: GroupRunAlignment.start,
        textAlign: TextAlign.center,
        textPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        elevation: 10,
      ),
    );
  }
}
