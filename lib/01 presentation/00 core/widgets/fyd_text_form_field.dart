import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:flutter/material.dart';

enum TextFieldColor { dark, light }

//! fydTextFormField
class FydTextFormField extends StatelessWidget {
  const FydTextFormField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.name,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    required this.labelText,
    this.textAlign = TextAlign.start,
    this.vPadding = 15,
    this.hPadding = 20,
    this.maxLength,
    this.fillColor = fydSblack,
    this.onSaved,
    this.validator,
    this.onScrollPadding = true,
    this.color = TextFieldColor.dark,
    this.isDigitOnly = false,
    this.labelColor = fydPgrey,
    this.floatColor = fydBbluegrey,
    this.inputStyle,
    this.labelSize = 20,
    this.letterSpacing = 1,
    this.keyboardAction = TextInputAction.next,
    this.inputColor,
  }) : super(key: key);

  final TextFieldColor color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String labelText;
  final TextAlign textAlign;
  final double vPadding;
  final double hPadding;
  final int? maxLength;
  final Color fillColor;
  final Function(String?)? onSaved;
  final bool onScrollPadding;
  final String? Function(String?)? validator;
  final bool isDigitOnly;
  final Color labelColor;
  final Color floatColor;
  final double labelSize;
  final TextStyle? inputStyle;
  final double letterSpacing;
  final TextInputAction keyboardAction;
  final Color? inputColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters:
          (isDigitOnly) ? [FilteringTextInputFormatter.digitsOnly] : [],
      autofocus: autoFocus,
      textCapitalization: textCapitalization,
      controller: controller,
      // text Styling
      style: inputStyle ??
          TextStyle(
            color: inputColor ??
                ((color == TextFieldColor.dark) ? fydTBlack : fydPgrey),
            fontWeight: FontWeight.w500,
            letterSpacing: letterSpacing,
            height: 1.5,
            fontSize: 19,
            decoration: TextDecoration.none,
          ),
      textAlign: textAlign,
      showCursor: true,
      maxLength: maxLength,
      textInputAction: keyboardAction,
      cursorColor: (color == TextFieldColor.dark) ? fydSblack : fydPgrey,
      cursorWidth: 2,
      cursorHeight: 30,

      // scrolling
      scrollPadding: (onScrollPadding)
          ? EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 60.h)
          : const EdgeInsets.all(0),
      // textfield styling
      decoration: InputDecoration(
        // focusColor: fydPDgrey,
        labelText: labelText,
        labelStyle: TextStyle(
            color: labelColor,
            fontSize: labelSize,
            fontWeight: FontWeight.w500),
        contentPadding:
            EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
        // to hide max length counter
        counterText: '',
        // fillColor: fillColor,
        floatingLabelStyle: TextStyle(
            color: floatColor, fontSize: 16, fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: (color == TextFieldColor.dark) ? fydPblack : fydPgrey,
              style: BorderStyle.solid,
              width: 2.0),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: (color == TextFieldColor.dark) ? fydSblack : fydSblack,
              style: BorderStyle.solid,
              width: 2.0),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: fydAred, style: BorderStyle.solid, width: 2.0),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: fydAred, style: BorderStyle.solid, width: 2.0),
        ),
      ),
    );
  }
}
