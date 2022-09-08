import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/constants/constants.dart';
import 'package:verifyd_store/controllers/controllers.dart';
import 'package:verifyd_store/data/authentication/phone_authentication_repo.dart';
import '../ui controller/auth_ui_controller.dart';
import '../widgets/fyd_num_pad.dart';

class OtpScreen extends StatelessWidget {
  // final AuthUiController authUiController;
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Resend Timer via authUi controller initiation
    AuthUiController.instance.resendTimer(60);
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TopsheetView(
                  auc: AuthUiController.instance,
                ),
                FydNumPad(
                    authUiController: AuthUiController.instance,
                    screenType: Screen.OtpScreen)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {
                      AuthUiController.instance.timerOn.value = false;
                      Get.back(closeOverlays: true);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 28.h,
                      color: fydPDgrey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopsheetView extends StatelessWidget {
  final AuthUiController auc;
  const TopsheetView({
    Key? key,
    required this.auc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
// all the widgets on this screen must have a height summation of 640-(24) => 636
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
    );
    return SizedBox(
      height: 336.h,
      child: Padding(
        padding:
            EdgeInsets.only(top: 40.h, left: 15.w, right: 15.w, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
// info text area
                    FydText.d1black(
                      text: AuthenticationString.OTPHEADING1,
                      weight: FontWeight.w100,
                    ),
                    FydText.d1black(
                      text: AuthenticationString.OTPHEADING2,
                      weight: FontWeight.w100,
                    ),
                    FydText.b1white(
                      text: AuthenticationString.TRANSPARENTTEXT,
                      weight: FontWeight.w100,
                    ),
                    FydText.b4black(
                        text:
                            '${AuthenticationString.OTPSUBHEADING}${auc.phoneNo}'),
// Otp Textfield ui
                    Padding(
                      padding: EdgeInsets.only(top: 18.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return (auc.otp.value != '')
                                ? Text(
                                    auc.otp.value,
                                    style: TextStyle(
                                        fontSize: 26.sp,
                                        letterSpacing: 5.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    auc.otpText,
                                    style: TextStyle(
                                        fontSize: 26.sp,
                                        letterSpacing: 3.0,
                                        color: const Color.fromARGB(
                                                221, 104, 103, 103)
                                            .withOpacity(.4),
                                        fontWeight: FontWeight.w500),
                                  );
                          }),
                        ],
                      ),
                    ),
// Resend Btn ui
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0.h,
                        right: 5.w,
                      ),
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FydText.b4grey(
                                text: '( ${auc.timeleft.value.toString()}s )'),
                            TextButton(
                              onPressed: (auc.timeleft.value != 0)
                                  ? null
                                  : () async {
                                      FydLoader.showLoading();
                                      auc.otp.value = '';
                                      auc.timerOn.value = false;
                                      await AuthController.instance.sendOtp();
                                      if (PhoneAuthRepo.vId != '') {
                                        auc.timerOn.value = true;
                                        FydLoader.hideLoading();
                                      } else {
                                        Get.back();
                                      }
                                    },
                              style: TextButton.styleFrom(
                                primary: fydPDgrey,
                                onSurface: fydPLgrey, // Disable color
                              ),
                              child: Text(
                                AuthenticationString.OTPRESEND,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ],
            ),
// Confirm Btn ui
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: FydBtn(
                        fydText: FydText.h1white(
                            text: AuthenticationString.CONFIRMBTN),
                        onPressed: () {
                          if (auc.otp.value.length == 6) {
                            FydLoader.showLoading();
                            AuthController.instance.otp.value = auc.otp.value;
                            AuthController.instance.verifyOtp();
                          } else {
                            fydSnack(
                                message: AuthenticationString.OTPVALIDATION,
                                snackposition: SnackPosition.TOP);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
