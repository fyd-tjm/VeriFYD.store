import 'package:flutter/material.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class FydTextScroller extends StatelessWidget {
  final double width;
  final double height;
  final FydText fydText;
  const FydTextScroller(
      {Key? key,
      required this.width,
      required this.height,
      required this.fydText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Marquee(
        text: fydText.text,
        style: GoogleFonts.exo2(
            color: fydText.color,
            fontSize: fydText.style.fontSize,
            fontWeight: fydText.weight),
        blankSpace: 40,
        velocity: 50,
      ),
    );
  }
}
