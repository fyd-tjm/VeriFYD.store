// ignore_for_file: non_constant_identifier_names
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import '../../00 ui-core/ui_exports.dart';

import 'widgets/key_pad.dart';

class PhoneLoginWrapperPage extends StatelessWidget {
  const PhoneLoginWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PhoneLoginBloc>(),
      child: const AutoRouter(),
    );
  }
}

class PhoneLoginPage extends HookWidget {
  const PhoneLoginPage({
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
    final phoneText = useState('');
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            topView(phoneText, context),
            FydNumPad(
              screenType: Screen.PhoneScreen,
              text: phoneText,
              onPhoneLengthValidation: () {
                showSnack(context: context, message: '10 digit long only');
              },
              onOtpLengthValidation: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget topView(
    ValueNotifier<String> phoneText,
    BuildContext context,
  ) {
    return BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
      listenWhen: (previous, current) {
        if (context.router.currentUrl == '/login') {
          return true;
        }
        return false;
      },
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
                    (success) =>
                        showSnack(context: context, message: 'success!'),
                  ));
        }
        if (state.isCodeSent) {
          context.router.pushNamed(Rn.otp);
        }
      },
      buildWhen: (previous, current) {
        if (context.router.currentUrl == '/login') {
          return true;
        }
        return false;
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
                  //! text view section
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Info text ui
                          const FydText.d1black(
                            text: 'Enter',
                            weight: FontWeight.w600,
                          ),
                          const FydText.d1black(
                            text: 'mobile number',
                            weight: FontWeight.w600,
                          ),
                          const FydText.h2custom(
                            text: 'TRANSPARENT',
                            color: Colors.transparent,
                          ),
                          const FydText.h2custom(
                            text: 'TRANSPARENT',
                            color: Colors.transparent,
                          ),
                          const FydText.h2custom(
                            text: 'TRANSPARENT',
                            color: Colors.transparent,
                          ),
                          const FydText.b3black(
                            text: 'we will send you a confirmation code',
                            weight: FontWeight.w500,
                          ),
                          // PhoneNumber text ui
                          Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Row(
                              children: [
                                const FydText.h1custom(
                                  text: '+91  ',
                                  weight: FontWeight.w400,
                                  letterSpacing: 1.1,
                                  color: fydTGrey,
                                ),
                                (phoneText.value.isNotEmpty)
                                    ? FydText.h1black(
                                        text: phoneText.value,
                                        letterSpacing: 3,
                                      )
                                    : const FydText.h1custom(
                                        text: 'XXXX-XXX-XXX',
                                        color: fydTGrey,
                                        letterSpacing: 2,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //! send Otp Btn
                  FydBtn(
                    height: 60.h,
                    widget: (state.isSubmitting == true)
                        ? const SpinKitWave(color: fydPWhite, size: 20.0)
                        : FydText.h2custom(
                            text: 'Send Otp',
                            color: (phoneText.value.length != 10)
                                ? fydTGrey
                                : fydTWhite,
                          ),
                    onPressed: () async {
                      HapticFeedback.mediumImpact();
                      if (phoneText.value.length != 10) {
                        showSnack(
                            context: context, message: 'enter 10 digit number');
                      } else {
                        //? sendOtpEvent
                        context
                            .read<PhoneLoginBloc>()
                            .add(PhoneLoginEvent.sendOtp(
                              phoneNumber: PhoneNumber(phoneText.value),
                            ));
                      }
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
