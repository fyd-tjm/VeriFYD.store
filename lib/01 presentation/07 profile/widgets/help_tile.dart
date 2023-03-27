//! HelpTile

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

class HelpTile extends StatelessWidget {
  final Widget icon;
  final String heading;
  final String? subHeading;
  final Function onPressed;
  const HelpTile({
    Key? key,
    required this.icon,
    required this.heading,
    this.subHeading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onPressed();
      },
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Card(
          color: fydSblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              SizedBox(
                height: 60.h,
                width: 60.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: icon,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FydText.b3white(
                      text: heading,
                      weight: FontWeight.w600,
                    ),
                    (subHeading != null)
                        ? FydText.b4white(
                            text: subHeading!,
                            letterSpacing: 1.2,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
