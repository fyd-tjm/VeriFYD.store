//! Type-chip
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_styles.dart';

class StoreTypeChip extends StatelessWidget {
  final String title;
  final Color? color;
  final Function(String) onPressed;

  const StoreTypeChip({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 100.w),
      child: SizedBox(
        height: 80.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: fydSblack,
              // background
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h)),
          onPressed: () {
            HapticFeedback.lightImpact();
            onPressed(title);
          },
          child: Text(
            title,
            style: TextStyle(
                color: (color != null) ? color : fydPwhite,
                fontSize: body14.fontSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
