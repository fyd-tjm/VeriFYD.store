import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';

class FydDropdownSection extends StatefulWidget {
  final String description;
  final String heading;
  const FydDropdownSection({
    Key? key,
    required this.description,
    required this.heading,
  }) : super(key: key);

  @override
  State<FydDropdownSection> createState() => _FydDropdownSectionState();
}

class _FydDropdownSectionState extends State<FydDropdownSection> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FydText.h2white(text: widget.heading),
            IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon((_isVisible)
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded),
              color: fydPWhite,
              iconSize: 50.sp,
              splashRadius: 20.r,
              splashColor: fydPGrey,
            ),
          ],
        ),
        Visibility(
          visible: _isVisible,
          child: FydText.b3grey(text: widget.description)
              .paddingSymmetric(vertical: 0.h, horizontal: 5.w),
        )
      ],
    );
  }
}
