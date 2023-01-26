import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/constants/constants.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import 'widgets/key_pad.dart';

class OtpLoginPage extends HookWidget {
  const OtpLoginPage({
    Key? key,
  }) : super(key: key);
//?-----------------------------------------------------------------------------

//? Referenced Size (890, 400) // usable H 838.6
//? TopSheet H => 468
//? KeyPad H => 370

//?-----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    final otpText = useState('');
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                topView(context, otpText),
                FydNumPad(
                  screenType: Screen.OtpScreen,
                  text: otpText,
                  onPhoneLengthValidation: () {},
                  onOtpLengthValidation: () {
                    showSnack(
                        context: context,
                        message: AuthenticationString.OTPVALIDATION);
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
//! back btn
                  IconButton(
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      context.router.pop();
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

//?-----------------------------------------------------------------------------
  Widget topView(BuildContext context, ValueNotifier<String> otpText) {
    return BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
      listener: (context, state) {
        if (state.failureOrSuccess.isSome()) {
          state.failureOrSuccess.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                    (failure) => showSnack(
                        context: context,
                        message: failure.whenOrNull(
                          invalidPhoneNumber: () => 'invalid Phone Number',
                          invalidOtpEntered: () => 'invalid Otp Entered',
                          sessionExpired: () => 'session Expired: try again',
                          userDisabled: () => 'user is disabled',
                          tooManyRequests: () => 'too Many Requests: try again',
                          serverError: () => 'server Error',
                          unknownError: () => 'something went wrong',
                        )),
                    (success) {
                      context.router.replaceAll([const LandingWrapperRoute()]);
                    },
                  ));
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 468.h,
          child: Padding(
            padding: EdgeInsets.only(
                top: 40.h, left: 15.w, right: 15.w, bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //! otp text view
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
                        FydText.h2white(
                          text: AuthenticationString.TRANSPARENTTEXT,
                          weight: FontWeight.w100,
                        ),
                        FydText.h2white(
                          text: AuthenticationString.TRANSPARENTTEXT,
                          weight: FontWeight.w100,
                        ),
                        FydText.h2white(
                          text: AuthenticationString.TRANSPARENTTEXT,
                          weight: FontWeight.w100,
                        ),
                        //! phoneNumber via bloc state
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FydText.b4black(
                                text: AuthenticationString.OTPSUBHEADING),
                            Builder(builder: (context) {
                              final phoneNumber = context.select(
                                  (PhoneLoginBloc bloc) =>
                                      bloc.state.phoneNumber);
                              return FydText.b2black(
                                text:
                                    Helpers.phoneMask(phoneNumber.getOrCrash()),
                                weight: FontWeight.w600,
                              );
                            })
                          ],
                        ),
                        // Otp Textfield ui
                        Padding(
                          padding: EdgeInsets.only(top: 25.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (otpText.value.isNotEmpty)
                                  ? Text(
                                      otpText.value,
                                      style: TextStyle(
                                          fontSize: 26.sp,
                                          letterSpacing: 5.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Text(
                                      ("X-X-X-X-X-X"),
                                      style: TextStyle(
                                          fontSize: 26.sp,
                                          letterSpacing: 3.0,
                                          color: const Color.fromARGB(
                                                  221, 104, 103, 103)
                                              .withOpacity(.4),
                                          fontWeight: FontWeight.w500),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //! confirm-otp btn
                Center(
                  child: FydBtn(
                    height: 60.h,
                    widget: (state.isSubmitting == true)
                        ? const SpinKitWave(color: fydPWhite, size: 20.0)
                        : FydText.h1white(text: 'Confirm Otp'),
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      // validate if otp
                      if (otpText.value.length != 6) {
                        showSnack(
                            context: context, message: '6 digit otp expected');
                      } else {
                        // add confirmOtp event
                        context
                            .read<PhoneLoginBloc>()
                            .add(PhoneLoginEvent.confirmOtp(
                              otp: Otp(otpText.value),
                            ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
//?-----------------------------------------------------------------------------

}
