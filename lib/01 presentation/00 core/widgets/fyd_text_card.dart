import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydTextCard extends StatelessWidget {
  const FydTextCard({
    Key? key,
    required this.message,
    required this.textColor,
    this.textSize = 16,
    this.weight = FontWeight.bold,
    required this.padding,
    this.backgroundColor = fydSwhite,
    this.onTap,
    this.maxLines,
    this.overflow,
    this.textAlign = TextAlign.center,
    this.letterSpacing,
  }) : super(key: key);
  final String message;
  final Color textColor;
  final FontWeight weight;
  final double? textSize;
  final EdgeInsets padding;
  final Color backgroundColor;
  final void Function()? onTap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: padding,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            InkWell(
              onTap: onTap,
              child: Text(
                message,
                style: GoogleFonts.exo2(
                    fontWeight: weight,
                    color: textColor,
                    fontSize: textSize,
                    letterSpacing: letterSpacing),
                maxLines: maxLines,
                overflow: overflow,
                textAlign: textAlign,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
