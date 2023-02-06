// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

// enum for numpad and textfield integration via authUi controller
enum Screen { PhoneScreen, OtpScreen }

class FydNumPad extends StatelessWidget {
  const FydNumPad({
    Key? key,
    required this.screenType,
    required this.text,
    required this.onPhoneLengthValidation,
    required this.onOtpLengthValidation,
  }) : super(key: key);
  final ValueNotifier<String> text;
  final Screen screenType;
  final Function onPhoneLengthValidation;
  final Function onOtpLengthValidation;

  @override
  Widget build(BuildContext context) {
//? summation of all widgets heigt must be 370

    return Container(
      height: 370.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: fydPDgrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => NumBtn(
                    number: '${index + 1}',
                    screenType: screenType,
                    text: text,
                    onPhoneLengthValidation: onPhoneLengthValidation,
                    onOtpLengthValidation: onOtpLengthValidation,
                  ),
                ).toList()),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => NumBtn(
                    number: '${index + 4}',
                    screenType: screenType,
                    text: text,
                    onPhoneLengthValidation: onPhoneLengthValidation,
                    onOtpLengthValidation: onOtpLengthValidation,
                  ),
                ).toList()),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => NumBtn(
                    number: '${index + 7}',
                    screenType: screenType,
                    text: text,
                    onPhoneLengthValidation: onPhoneLengthValidation,
                    onOtpLengthValidation: onOtpLengthValidation,
                  ),
                ).toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 85.h,
                  width: 100.w,
                  child: const Center(
                    child: Text(
                      's',
                      style: TextStyle(color: Colors.transparent),
                    ),
                  ),
                ),
                NumBtn(
                  number: '0',
                  screenType: screenType,
                  text: text,
                  onPhoneLengthValidation: onPhoneLengthValidation,
                  onOtpLengthValidation: onOtpLengthValidation,
                ),
                NumBtn(
                  number: '<',
                  screenType: screenType,
                  text: text,
                  onPhoneLengthValidation: onPhoneLengthValidation,
                  onOtpLengthValidation: onOtpLengthValidation,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumBtn extends StatelessWidget {
  final String number;
  final ValueNotifier<String> text;
  final Screen screenType;
  final Function onPhoneLengthValidation;
  final Function onOtpLengthValidation;

  const NumBtn({
    Key? key,
    required this.number,
    required this.screenType,
    required this.text,
    required this.onPhoneLengthValidation,
    required this.onOtpLengthValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: _onTapHandler,
// ui logic
      child: Ink(
        height: 85.h,
        width: 100.h,
        child: (number != '<')
            ? Center(
                child: FydText.h1custom(
                  text: number,
                  color: fydLogoGreen,
                ),
              )
            : Center(
                child: Icon(
                  Icons.backspace_rounded,
                  size: 24.h,
                  color: fydPWhite,
                ),
              ),
      ),
    );
  }

  _onTapHandler() {
    HapticFeedback.mediumImpact();
// Check ScreenType for TextField Integration For PhoneAuth
    if (screenType == Screen.PhoneScreen) {
// check btn type
      if (number != '<') {
// check validation logic.

        if (text.value.length <= 9) {
          text.value += number;
        } else {
          onPhoneLengthValidation();
        }
      } else {
        if (text.value.isEmpty) {
        } else {
          text.value = text.value.substring(0, text.value.length - 1);
        }
      }
    } else
// for OtpScreen
    {
      if (number != '<') {
        if (text.value.length <= 5) {
          text.value += number;
        } else {
          onOtpLengthValidation();
        }
      } else {
        if (text.value.isEmpty) {
        } else {
          text.value = text.value.substring(0, text.value.length - 1);
        }
      }
    }
  }
}
