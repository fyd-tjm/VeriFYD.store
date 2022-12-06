import 'package:flutter/material.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:google_fonts/google_fonts.dart';

class FydTextEllipsis extends StatelessWidget {
  final double width;
  final FydText fydText;
  final TextAlign textAlignmnet;

  const FydTextEllipsis({
    Key? key,
    required this.width,
    this.textAlignmnet = TextAlign.start,
    required this.fydText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        fydText.text,
        textAlign: textAlignmnet,
        style: GoogleFonts.exo2(
            color: fydText.color,
            fontSize: fydText.style.fontSize,
            fontWeight: fydText.weight),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
