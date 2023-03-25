import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class Tracker4 extends StatelessWidget {
  const Tracker4({
    Key? key,
    required this.activeIndex,
    required this.activeColor,
  }) : super(key: key);
  final int activeIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(4, (index) {
        if (index == 3) {
          return TrackerStep(
            enabledColor: activeColor,
            disabledColor: fydSwhite,
            isActive: (activeIndex >= index),
            isLast: true,
          );
        }
        return TrackerStep(
          enabledColor: activeColor,
          disabledColor: fydSwhite,
          isActive: (activeIndex >= index),
        );
      }),
    );
  }
}

class TrackerStep extends StatelessWidget {
  final Color enabledColor;
  final Color disabledColor;
  final bool isLast;
  final bool isActive;
  const TrackerStep({
    Key? key,
    this.isLast = false,
    required this.enabledColor,
    required this.disabledColor,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: (isActive) ? enabledColor : disabledColor,
          radius: 12.r,
        ),
        (!isLast)
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (isActive) ? enabledColor : disabledColor,
                      Colors.white
                    ],
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 1.0,
                width: 70,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
