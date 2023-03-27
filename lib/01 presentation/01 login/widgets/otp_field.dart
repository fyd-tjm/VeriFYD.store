import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

//?-----------------------------------------------------------------------------

class OtpField extends StatelessWidget {
  const OtpField({Key? key, required this.pinController}) : super(key: key);
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    final borderColor = fydBblue.withOpacity(.9);
    const color = fydSgrey;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: GoogleFonts.exo2(
          fontSize: 22, color: fydSblack, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        // color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
    );
    return SizedBox(
      height: 60,
      child: Pinput(
        length: 6,
        controller: pinController,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        pinAnimationType: PinAnimationType.scale,
        showCursor: false,
        closeKeyboardWhenCompleted: false,
        keyboardType: TextInputType.number,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.none,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor, width: 2),
          ),
        ),
      ),
    );
  }
}
