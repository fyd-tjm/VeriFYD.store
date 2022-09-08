// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/constants/constants.dart';

import '../ui controller/auth_ui_controller.dart';

// enum for numpad and textfield integration via authUi controller
enum Screen { PhoneScreen, OtpScreen }

class FydNumPad extends StatelessWidget {
  const FydNumPad({
    Key? key,
    required this.authUiController,
    required this.screenType,
  }) : super(key: key);

  final AuthUiController authUiController;
  final Screen screenType;

  @override
  Widget build(BuildContext context) {
// summation of all widgets heigt must be 640-(24) => 616
    ScreenUtil.init(context,
        designSize: const Size(360, 640), minTextAdapt: true);
    return Container(
      height: 280.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: fydPDgrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
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
              children: [
                NumBtn(
                  number: '1',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '2',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '3',
                  auc: authUiController,
                  screenType: screenType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumBtn(
                  number: '4',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '5',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '6',
                  auc: authUiController,
                  screenType: screenType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumBtn(
                  number: '7',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '8',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '9',
                  auc: authUiController,
                  screenType: screenType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 70.w,
                  child: const Center(
                    child: Text(
                      's',
                      style: TextStyle(color: Colors.transparent),
                    ),
                  ),
                ),
                NumBtn(
                  number: '0',
                  auc: authUiController,
                  screenType: screenType,
                ),
                NumBtn(
                  number: '<',
                  auc: authUiController,
                  screenType: screenType,
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
  final AuthUiController auc;
  final Screen screenType;

  const NumBtn({
    Key? key,
    required this.number,
    required this.auc,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// summation of all widgets heigt must be 640-(24) => 616
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
    );
    return InkWell(
      onTap: () {
// Check ScreenType for TextField Integration For PhoneAuth
        if (screenType == Screen.PhoneScreen) {
// check btn type
          if (number != '<') {
// check validation logic.

            if (auc.phoneNo.value.length <= 9) {
              auc.phoneNo.value += number;
            } else {
              fydSnack(
                  message: AuthenticationString.NUMBERVALIDATION,
                  snackposition: SnackPosition.TOP);
            }
          } else {
            if (auc.phoneNo.value.isEmpty) {
            } else {
              auc.phoneNo.value =
                  auc.phoneNo.value.substring(0, auc.phoneNo.value.length - 1);
            }
          }
        } else
// for OtpScreen
        {
          if (number != '<') {
            if (auc.otp.value.length <= 5) {
              auc.otp.value += number;
            } else {
              fydSnack(
                  message: AuthenticationString.OTPVALIDATION,
                  snackposition: SnackPosition.TOP);
            }
          } else {
            if (auc.otp.value.isEmpty) {
            } else {
              auc.otp.value =
                  auc.otp.value.substring(0, auc.otp.value.length - 1);
            }
          }
        }
      },
// ui logic
      child: Ink(
        height: 50.h,
        width: 70.w,
        child: (number != '<')
            ? Center(
                child: FydText.h1white(text: number),
              )
            : Center(
                child: Icon(
                  Icons.backspace_rounded,
                  size: 22.h,
                  color: fydPWhite,
                ),
              ),
      ),
    );
  }
}
