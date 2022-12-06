// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:verifyd_store/00%20ui-core/core/fyd_colors.dart';
import 'package:verifyd_store/00%20ui-core/core/fyd_styles.dart';

class FydText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final FontWeight weight;
  final Color color;

  // display-custom

  FydText.d1custom({
    required this.text,
    required this.color,
    this.weight = FontWeight.bold,
  }) : style = display38.copyWith(color: color, fontWeight: weight);

  // display-white

  FydText.d1white(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTWhite})
      : style = display38.copyWith(color: color, fontWeight: weight);

  FydText.d2white(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTWhite})
      : style = display34.copyWith(color: color, fontWeight: weight);

  FydText.d3white(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTWhite})
      : style = display30.copyWith(color: color, fontWeight: weight);

  // display-black

  FydText.d1black(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTBlack})
      : style = display38.copyWith(color: color, fontWeight: weight);

  FydText.d2black(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTBlack})
      : style = display34.copyWith(color: color, fontWeight: weight);

  FydText.d3black(
      {required this.text,
      this.weight = FontWeight.bold,
      this.color = fydTBlack})
      : style = display30.copyWith(color: color, fontWeight: weight);

  // heading-white

  FydText.h1white(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTWhite})
      : style = heading22.copyWith(color: color, fontWeight: weight);

  FydText.h2white(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTWhite})
      : style = heading20.copyWith(color: color, fontWeight: weight);

  FydText.h3white(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTWhite})
      : style = heading18.copyWith(color: color, fontWeight: weight);

  // heading-black

  FydText.h1black(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTBlack})
      : style = heading22.copyWith(color: color, fontWeight: weight);

  FydText.h2black(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTBlack})
      : style = heading20.copyWith(color: color, fontWeight: weight);

  FydText.h3black(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = fydTBlack})
      : style = heading18.copyWith(color: color, fontWeight: weight);

  // heading-grey

  FydText.h1grey(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = Colors.transparent})
      : style = heading22.copyWith(color: fydTGrey, fontWeight: weight);

  FydText.h2grey(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = Colors.transparent})
      : style = heading20.copyWith(color: fydTGrey, fontWeight: weight);

  FydText.h3grey(
      {required this.text,
      this.weight = FontWeight.w500,
      this.color = Colors.transparent})
      : style = heading18.copyWith(color: fydTGrey, fontWeight: weight);

  // body-white

  FydText.b1white(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTWhite})
      : style = body16.copyWith(color: color, fontWeight: weight);

  FydText.b2white(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTWhite})
      : style = body14.copyWith(color: color, fontWeight: weight);

  FydText.b3white(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTWhite})
      : style = body12.copyWith(color: color, fontWeight: weight);

  FydText.b4white(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTWhite})
      : style = body10.copyWith(color: color, fontWeight: weight);

  // body-black

  FydText.b1black(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTBlack})
      : style = body16.copyWith(color: color, fontWeight: weight);

  FydText.b2black(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTBlack})
      : style = body14.copyWith(color: color, fontWeight: weight);

  FydText.b3black(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTBlack})
      : style = body12.copyWith(color: color, fontWeight: weight);

  FydText.b4black(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTBlack})
      : style = body10.copyWith(color: color, fontWeight: weight);

  // body-grey

  FydText.b1grey(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTGrey})
      : style = body16.copyWith(color: color, fontWeight: weight);

  FydText.b2grey(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTGrey})
      : style = body14.copyWith(color: color, fontWeight: weight);

  FydText.b3grey(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTGrey})
      : style = body12.copyWith(color: color, fontWeight: weight);

  FydText.b4grey(
      {required this.text,
      this.weight = FontWeight.normal,
      this.color = fydTGrey})
      : style = body10.copyWith(color: color, fontWeight: weight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
