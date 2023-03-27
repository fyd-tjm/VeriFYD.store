import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

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
      return ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              fydBblue,
              Colors.transparent,
              Colors.transparent,
              fydBblue
            ],
            stops: [0.0, 0.05, 0.95, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SizedBox(
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
                      FydText.h2custom(
                        text: categoryHeader,
                        weight: FontWeight.w700,
                        color: fydPwhite,
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
                        child: FydText.b3custom(
                          text: footer,
                          color: fydBbluegrey,
                        )),
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
        ),
      );
    }
  }
}
