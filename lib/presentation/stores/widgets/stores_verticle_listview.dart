import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class StoresVerticleListview extends StatelessWidget {
  final String categoryHeader;
  final List<Widget> widgetList;
  final String footer;
  final VoidCallback onPressed;
  const StoresVerticleListview(
      {Key? key,
      required this.categoryHeader,
      required this.widgetList,
      required this.footer,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: (2 + widgetList.length),
        itemBuilder: ((context, index) {
          if (index == 0) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FydText.h1white(text: categoryHeader),
              ],
            ).paddingOnly(top: 20.h, left: 20.w);
          } else if (index == (1 + widgetList.length)) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: onPressed, child: FydText.b3white(text: footer)),
              ],
            );
          } else {
            return widgetList[index - 1];
          }
        }),
        separatorBuilder: (context, index) => SizedBox(
          height: 20.h,
        ),
      ),
    );
  }
}
