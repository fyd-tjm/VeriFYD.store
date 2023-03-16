import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class StoreListView extends StatelessWidget {
  final String footer;
  final VoidCallback onPressed;
  final List<Widget> widgetList;
  const StoreListView(
      {Key? key,
      required this.footer,
      required this.onPressed,
      required this.widgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [fydBblue, Colors.transparent, Colors.transparent, fydBblue],
          stops: [0.0, 0.04, 0.96, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: (1 + widgetList.length),
          itemBuilder: ((context, index) {
            if (index == (widgetList.length)) {
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
              if (index.isEven) {
                return widgetList[index];
              } else {
                return const SizedBox.shrink();
              }
            }
          }),
          separatorBuilder: (context, index) => SizedBox(
            height: 5.h,
          ),
        ),
      ),
    );
  }
}

class StoreGridRow extends StatelessWidget {
  final Widget widgetOne;
  final Widget? widgetTwo;
  const StoreGridRow({Key? key, required this.widgetOne, this.widgetTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widgetOne,
        const Spacer(),
        (widgetTwo != null) ? widgetTwo! : const SizedBox.shrink()
      ],
    );
  }
}
