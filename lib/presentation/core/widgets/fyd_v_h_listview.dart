import 'package:flutter/material.dart';

class FydVListView extends StatelessWidget {
  final double width;
  final double separation;
  final int itemCount;
  final List<Widget> listWidget;
  final EdgeInsets? widgetListPadding;
  const FydVListView({
    Key? key,
    required this.width,
    required this.separation,
    required this.itemCount,
    required this.listWidget,
    this.widgetListPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ListView.separated(
        padding: widgetListPadding,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
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
  final EdgeInsets? widgetListPadding;
  final int itemCount;
  final List<Widget> listWidget;
  const FydHListView({
    Key? key,
    required this.height,
    required this.separation,
    required this.itemCount,
    required this.listWidget,
    this.widgetListPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: widgetListPadding,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: ((context, index) => listWidget[index]),
        separatorBuilder: (context, index) => SizedBox(
          width: separation,
        ),
      ),
    );
  }
}
