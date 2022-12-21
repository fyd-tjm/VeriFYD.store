import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class StoresVerticleListview extends StatelessWidget {
  final String categoryHeader;
  final List<Widget> widgetList;
  final String footer;
  final VoidCallback onPressed;
  final Widget onEmptyListWidget;
  const StoresVerticleListview(
      {Key? key,
      required this.categoryHeader,
      required this.widgetList,
      required this.footer,
      required this.onPressed,
      required this.onEmptyListWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (widgetList.isEmpty) {
      return onEmptyListWidget;
    } else {
      return SizedBox(
        width: double.infinity,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: (2 + widgetList.length),
          itemBuilder: ((context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FydText.h1custom(
                      text: categoryHeader,
                      weight: FontWeight.w700,
                      color: fydDustyPeach,
                    ),
                  ],
                ),
              );
            } else if (index == (1 + widgetList.length)) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: onPressed,
                      child: FydText.b3white(text: footer)),
                ],
              );
            } else {
              return widgetList[index - 1];
            }
          }),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
        ),
      );
    }
  }
}
