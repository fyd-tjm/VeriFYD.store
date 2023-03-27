import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

class StoreInfoExpansionTile extends StatelessWidget {
  const StoreInfoExpansionTile({
    Key? key,
    required this.title,
    this.titleSize = 22,
    required this.color,
    this.expanded = false,
    required this.widgets,
  }) : super(key: key);

  final String title;
  final double titleSize;
  final Color color;
  final bool expanded;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ExpansionTile(
        initiallyExpanded: expanded,
        backgroundColor: fydSblack,
        collapsedBackgroundColor: fydSblack,
        iconColor: fydPgrey,
        collapsedIconColor: color,
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        title: FydText.h3custom(
          color: color,
          size: titleSize,
          text: title,
          weight: FontWeight.w600,
        ),
        children: widgets,
      ),
    );
  }
}
