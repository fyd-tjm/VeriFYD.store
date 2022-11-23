import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:group_button/group_button.dart';

class OrdersGroupBtn extends StatelessWidget {
  final GroupButtonController controller;
  final EdgeInsets hvPadding;
  final List<String> btnNameList;
  final Function(String, int, bool) onSelected;

  OrdersGroupBtn(
      {Key? key,
      required this.controller,
      required this.hvPadding,
      required this.btnNameList,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupButton(
      onSelected: onSelected,
      controller: controller,
      buttons: btnNameList,
      options: GroupButtonOptions(
        selectedShadow: const [],
        unselectedShadow: const [],
        selectedColor: fydPGrey,
        unselectedColor: fydPGrey,
        unselectedTextStyle: TextStyle(
          fontSize: heading22.fontSize,
          color: fydPLgrey,
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
        buttonWidth: 180.w,
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
