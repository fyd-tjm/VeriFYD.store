import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydTextField extends StatelessWidget {
  const FydTextField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    required this.prefixText,
    this.hintStyle = const TextStyle(fontSize: 22, color: fydSgrey),
    this.prefixStyle = const TextStyle(fontSize: 22, color: fydSgrey),
    this.inputStyle = const TextStyle(
      color: fydTWhite,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
      fontSize: 26,
      decoration: TextDecoration.none,
    ),
    this.textAlign = TextAlign.start,
    this.vPadding = 15,
    this.hPadding = 10,
    this.maxLength,
    this.fillColor = fydSblack,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final String prefixText;
  final TextStyle hintStyle;
  final TextStyle prefixStyle;
  final TextStyle inputStyle;
  final TextAlign textAlign;
  final double vPadding;
  final double hPadding;
  final int? maxLength;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      autofocus: autoFocus,
      textCapitalization: textCapitalization,
      controller: controller,
      // text Styling
      style: inputStyle,
      textAlign: textAlign,
      showCursor: false,
      maxLength: maxLength,

      // textfield styling
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        // prefixText: prefixText, prefixStyle: prefixStyle,
        isDense: true,
        prefixIcon: Text("   $prefixText  ", style: prefixStyle),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding:
            EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
        // to hide max length counter
        counterText: '',
        fillColor: fillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
