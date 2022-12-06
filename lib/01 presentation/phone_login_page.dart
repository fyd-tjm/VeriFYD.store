// ignore_for_file: non_constant_identifier_names
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/01%20presentation/widgets/key_pad.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';
import '../../00 ui-core/ui_exports.dart';
import 'package:verifyd_store/utils/constants/constants.dart';

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
    // log('/phoneLogin');
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
                showSnack(
                    context: context,
                    message: AuthenticationString.NUMBERVALIDATION);
              },
              onOtpLengthValidation: () {},
            )
          ],
        ),
      ),
    );
  }

  SizedBox topView(
    ValueNotifier<String> phoneText,
    BuildContext context,
  ) {
    return SizedBox(
      height: 468.h,
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
                    FydText.h2white(
                      text: AuthenticationString.TRANSPARENTTEXT,
                      weight: FontWeight.w100,
                    ),
                    FydText.h2white(
                      text: AuthenticationString.TRANSPARENTTEXT,
                      weight: FontWeight.w100,
                    ),
                    FydText.b4black(
                      text: AuthenticationString.SUBHEADING,
                      weight: FontWeight.w100,
                    ),
// PhoneNumber text ui
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        children: [
                          FydText.h1black(
                            text: AuthenticationString.COUNTRYCODE,
                            weight: FontWeight.w100,
                          ),
                          (phoneText.value.isNotEmpty)
                              ? Text(
                                  phoneText.value,
                                  style: TextStyle(
                                      fontSize: 26.sp,
                                      letterSpacing: 3.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  ('XXXX-XXX-XXX'),
                                  style: TextStyle(
                                      fontSize: 26.sp,
                                      letterSpacing: 3.0,
                                      color: const Color.fromARGB(
                                              221, 104, 103, 103)
                                          .withOpacity(.4),
                                      fontWeight: FontWeight.w500),
                                ),
                          // }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
//! Next Btn -- Bloc consumer
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
                      listener: (c1, state) async {
                        // isCodeSent State Handler(toggleIsCodeSent E + Navigate to Otp )

                        if (state.isCodeSent == true) {
                          // await Future.delayed(const Duration(seconds: 2));
                          context.read<PhoneLoginBloc>().add(
                              const PhoneLoginEvent.toggleIsCodeSentState());

                          context.router.push(const OtpLoginRoute());
                        } else {
                          if (state.authFailureOrSuccessOption != none()) {
                            showSnack(
                              context: context,
                              durationSeconds: 3,
                              message: state.authFailureOrSuccessOption.fold(
                                () => '',
                                (AuthFailureOrUnit) => AuthFailureOrUnit.fold(
                                    (authFailure) => authFailure.when(
                                          invalidPhoneNumber: () =>
                                              'invalid Phone Number',
                                          invalidOtpEntered: () =>
                                              'invalid Otp Entered',
                                          sessionExpired: () =>
                                              'session Expired: try again',
                                          tooManyRequests: () =>
                                              'too Many Requests: try again',
                                          serverError: () => 'server Error',
                                          unknownError: () =>
                                              'something went wrong',
                                          userDisabled: () =>
                                              'user is disabled',
                                        ),
                                    (unit) => 'success!'),
                              ),
                            );
                          }
                        }
                      },
                      builder: (context, state) => FydBtn(
                        widget: (state.isSubmitting == true)
                            ? const SpinKitWave(color: fydPWhite, size: 20.0)
                            : FydText.h1white(
                                text: AuthenticationString.NEXTBTN),
                        onPressed: () async {
                          HapticFeedback.mediumImpact();
                          //? phoneNumber validation
                          if (state.isSubmitting == true) return;
                          if (phoneText.value.length != 10) {
                            showSnack(
                                context: context,
                                message: 'enter 10 digit number');
                          } else {
                            //? PhoneNumberUpdatedEvent
                            context.read<PhoneLoginBloc>().add(
                                  PhoneLoginEvent.phoneNumberUpdate(
                                    phoneNumber: PhoneNumber(phoneText.value),
                                  ),
                                );
                            //? sendOtpEvent
                            context
                                .read<PhoneLoginBloc>()
                                .add(const PhoneLoginEvent.sendOtp());
                          }
                        },
                      ),
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
