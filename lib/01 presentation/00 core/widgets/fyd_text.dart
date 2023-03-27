// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_colors.dart';

//?-----------------------------------------------------------------------------
class FydAutoScrollingText extends HookWidget {
  final double width;
  final double height;
  final FydText fydText;
  final int? rounds;
  final double velocity;
  const FydAutoScrollingText(
      {Key? key,
      required this.width,
      required this.height,
      required this.fydText,
      this.velocity = 50,
      this.rounds})
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
          fontWeight: fydText.weight,
          fontSize: fydText.size,
        ),
        blankSpace: 40,
        velocity: 50,
        numberOfRounds: rounds,
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class FydEllipsisText extends StatelessWidget {
  final double width;
  final FydText fydText;
  final TextAlign textAlignmnet;
  final int maxLines;

  const FydEllipsisText({
    Key? key,
    required this.width,
    this.textAlignmnet = TextAlign.start,
    required this.fydText,
    this.maxLines = 1,
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
          fontWeight: fydText.weight,
          fontSize: fydText.size,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class FydRichText extends StatelessWidget {
  final List<TextSpan> textList;
  final double size;
  final Color color;
  final FontWeight weight;
  final bool isSelectable;
  final bool isScalable;
  final TextAlign textAlign;
  final double? letterSpacing;

  const FydRichText(
      {Key? key,
      required this.textList,
      required this.size,
      this.color = fydPblack,
      this.weight = FontWeight.bold,
      this.isSelectable = false,
      this.isScalable = true,
      this.textAlign = TextAlign.start,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isSelectable)
        ? SelectableText.rich(
            TextSpan(
                style: GoogleFonts.exo2(
                  color: color,
                  fontWeight: weight,
                  fontSize: (isScalable) ? size.sp : size,
                  letterSpacing: letterSpacing,
                ),
                children: textList),
            textAlign: textAlign,
          )
        : Text.rich(
            TextSpan(
                style: GoogleFonts.exo2(
                  color: color,
                  fontWeight: weight,
                  fontSize: (isScalable) ? size.sp : size,
                  letterSpacing: letterSpacing,
                ),
                children: textList),
            textAlign: textAlign,
          );
  }
}

//?-----------------------------------------------------------------------------
class FydText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final bool isSelectable;
  final bool isScalable;
  final TextAlign textAlign;
  final double? letterSpacing;

//?-----------------------------------------------------------------------------
  // custom
  const FydText.custom({
    required this.text,
    required this.color,
    required this.size,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

//?-----------------------------------------------------------------------------
  // display-custom
  const FydText.d1custom({
    required this.text,
    required this.color,
    this.size = 36,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d2custom({
    required this.text,
    required this.color,
    this.size = 32,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d3custom({
    required this.text,
    required this.color,
    this.size = 28,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // display-white
  const FydText.d1white({
    required this.text,
    this.color = fydTWhite,
    this.size = 36,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d2white({
    required this.text,
    this.color = fydTWhite,
    this.size = 32,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d3white({
    required this.text,
    this.color = fydTWhite,
    this.size = 28,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // display-black
  const FydText.d1black({
    required this.text,
    this.color = fydTBlack,
    this.size = 36,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d2black({
    required this.text,
    this.color = fydTBlack,
    this.size = 32,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.d3black({
    required this.text,
    this.color = fydTBlack,
    this.size = 28,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

//?-----------------------------------------------------------------------------
  // heading-custom

  const FydText.h1custom({
    required this.text,
    required this.color,
    this.size = 26,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h2custom({
    required this.text,
    required this.color,
    this.size = 24,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h3custom({
    required this.text,
    required this.color,
    this.size = 22,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // heading-white

  const FydText.h1white({
    required this.text,
    this.color = fydTWhite,
    this.size = 26,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h2white({
    required this.text,
    this.color = fydTWhite,
    this.size = 24,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h3white({
    required this.text,
    this.color = fydTWhite,
    this.size = 22,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // heading-black
  const FydText.h1black({
    required this.text,
    this.color = fydTBlack,
    this.size = 26,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h2black({
    required this.text,
    this.color = fydTBlack,
    this.size = 24,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.h3black({
    required this.text,
    this.color = fydTBlack,
    this.size = 22,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

//?-----------------------------------------------------------------------------
  // body-custom

  const FydText.b1custom({
    required this.text,
    required this.color,
    this.size = 20,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b2custom({
    required this.text,
    required this.color,
    this.size = 18,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b3custom({
    required this.text,
    required this.color,
    this.size = 16,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b4custom({
    required this.text,
    required this.color,
    this.size = 14,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // body-white

  const FydText.b1white({
    required this.text,
    this.color = fydTWhite,
    this.size = 20,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b2white({
    required this.text,
    this.color = fydTWhite,
    this.size = 18,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b3white({
    required this.text,
    this.color = fydTWhite,
    this.size = 16,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b4white({
    required this.text,
    this.color = fydTWhite,
    this.size = 14,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  // body-black

  const FydText.b1black({
    required this.text,
    this.color = fydTBlack,
    this.size = 20,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b2black({
    required this.text,
    this.color = fydTBlack,
    this.size = 18,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b3black({
    required this.text,
    this.color = fydTBlack,
    this.size = 16,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

  const FydText.b4black({
    required this.text,
    this.color = fydTBlack,
    this.size = 14,
    this.weight = FontWeight.bold,
    this.isSelectable = false,
    this.isScalable = true,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
  });

//?-----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return (isSelectable)
        ? SelectableText(
            text,
            textAlign: textAlign,
            style: GoogleFonts.exo2(
              color: color,
              fontWeight: weight,
              fontSize: (isScalable) ? size.sp : size,
              letterSpacing: letterSpacing,
            ),
          )
        : Text(
            text,
            textAlign: textAlign,
            style: GoogleFonts.exo2(
              color: color,
              fontWeight: weight,
              fontSize: (isScalable) ? size.sp : size,
              letterSpacing: letterSpacing,
            ),
          );
  }
}
//?-----------------------------------------------------------------------------