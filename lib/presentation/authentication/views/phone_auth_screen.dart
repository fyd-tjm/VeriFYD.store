import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/application/auth/sign_in_controller.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/constants/constants.dart';
import '../ui controller/auth_ui_controller.dart';
import '../widgets/fyd_num_pad.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            TopsheetView(
              auc: AuthUiController.instance,
            ),
            FydNumPad(
                authUiController: AuthUiController.instance,
                screenType: Screen.PhoneScreen)
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
// Info text ui
                    FydText.d1black(
                      text: AuthenticationString.MAINHEADING1,
                      weight: FontWeight.w100,
                    ),
                    FydText.d1black(
                      text: AuthenticationString.MAINHEADING2,
                      weight: FontWeight.w100,
                    ),
                    FydText.h2white(
                      text: AuthenticationString.TRANSPARENTTEXT,
                      weight: FontWeight.w100,
                    ),
                    FydText.b4black(text: AuthenticationString.SUBHEADING),
// Number textfield ui
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      child: Row(
                        children: [
                          FydText.h1black(
                            text: AuthenticationString.COUNTRYCODE,
                            weight: FontWeight.w100,
                          ),
                          Obx(() {
                            return (auc.phoneNo.value != '')
                                ? Text(
                                    auc.phoneNo.value,
                                    style: TextStyle(
                                        fontSize: 26.sp,
                                        letterSpacing: 3.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    auc.hintText,
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
                  ],
                ),
              ],
            ),
// Next Btn
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: FydBtn(
                      fydText:
                          FydText.h1white(text: AuthenticationString.NEXTBTN),
                      onPressed: () {
                        SignInController.i.phoneNumber.value =
                            PhoneNumber(auc.phoneNo.value);
                        auc.otp.value = '';
                        SignInController.i.sendOtpPressed();
                      },
                    ),
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
