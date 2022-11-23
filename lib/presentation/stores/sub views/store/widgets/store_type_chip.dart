import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../application/stores/store_ui_controller.dart';

class StoreTypeChip extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final int index;
  final StoreUiController controller;

  const StoreTypeChip({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 80.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: fydPGrey,
              // background
              onPrimary: (index == controller.selectedTypeIndex.value)
                  ? const Color(0xffD7FF66)
                  : fydPWhite, // foreground
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(15.r)),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h)),
          onPressed: () {
            onPressed;
            controller.selectedTypeIndex.value = index;
          },
          child: Text(
            title,
            style: TextStyle(
                color: (index == controller.selectedTypeIndex.value)
                    ? const Color(0xffD7FF66)
                    : fydPWhite,
                fontSize: body14.fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }
}
