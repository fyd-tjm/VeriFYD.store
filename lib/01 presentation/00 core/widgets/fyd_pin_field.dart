import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydPinField extends StatelessWidget {
  const FydPinField({
    Key? key,
    required this.pinController,
    this.onSubmitted,
  }) : super(key: key);
  final TextEditingController pinController;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    const borderColor = fydBblue;
    const fillColor = fydSblack;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: GoogleFonts.exo2(
          fontSize: 22, color: fydBbluegrey, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return SizedBox(
      height: 68,
      child: Pinput(
        length: 4,
        controller: pinController,
        pinAnimationType: PinAnimationType.scale,
        showCursor: false,
        closeKeyboardWhenCompleted: false,
        keyboardType: TextInputType.visiblePassword,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        onSubmitted: onSubmitted,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
      ),
    );
  }
}
