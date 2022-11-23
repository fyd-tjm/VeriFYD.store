import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FydVListView extends StatelessWidget {
  final double width;

  final double separation;
  final int itemCount;
  final List<Widget> listWidget;
  const FydVListView({
    Key? key,
    required this.width,
    required this.separation,
    required this.itemCount,
    required this.listWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: ((context, index) => listWidget[index]),
        separatorBuilder: (context, index) => SizedBox(
          height: separation,
        ),
      ),
    );
  }
}

class FydHListView extends StatelessWidget {
  final double height;
  final double separation;
  final int itemCount;
  final List<Widget> listWidget;
  const FydHListView({
    Key? key,
    required this.height,
    required this.separation,
    required this.itemCount,
    required this.listWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 25.w,
          right: 25.w,
        ),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: ((context, index) => listWidget[index]),
        separatorBuilder: (context, index) => SizedBox(
          width: separation, //15.w
        ),
      ),
    );
  }
}
