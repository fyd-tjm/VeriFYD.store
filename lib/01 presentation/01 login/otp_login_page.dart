import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../00 core/widgets/00_core_widgets_export.dart';
import 'widgets/otp_field.dart';

//?-----------------------------------------------------------------------------
class OtpLoginPage extends HookWidget {
  const OtpLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    //-------
    final otpText = useState('');
    final otpController = useTextEditingController();
    final update = useValueListenable(otpController);
    useEffect(() {
      otpText.value = update.text;
      return;
    }, [update]);
    //-------
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPDgrey,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
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
                              sessionExpired: () =>
                                  'session Expired: try again',
                              userDisabled: () => 'user is disabled',
                              tooManyRequests: () =>
                                  'too Many Requests: try again',
                              serverError: () => 'server Error',
                              unknownError: () => 'something went wrong',
                            )),
                        (success) {
                          FocusScope.of(context).unfocus();
                          context.router
                              .replaceAll([const LandingWrapperRoute()]);
                        },
                      ));
            }
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 380.h,
              topSheet: topSheetView(context, state, otpController),
              bottomSheet: bottomSheetView(context, state, otpText),
            );
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  topSheetView(
    BuildContext context,
    PhoneLoginState state,
    TextEditingController otpController,
  ) {
    return Container(
      decoration: const BoxDecoration(
        // background Image
        image: DecorationImage(
          image: AssetImage('assets/logo/bg.png'),
          fit: BoxFit.scaleDown,
          alignment: Alignment.topRight,
          opacity: .5,
          filterQuality: FilterQuality.high,
        ),
      ),
      // height: 460.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! AppBar(back-btn)
          FydAppBar(
            leading: AppBarBtn(
                iconData: FontAwesomeIcons.arrowLeftLong,
                bgColor: fydPWhite,
                iconColor: fydPGrey,
                iconSize: 20,
                padding: const EdgeInsets.all(10.0),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  context.router.pop();
                }),
            main: const SizedBox(),
          ),
          //! Heading
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FydText.d1black(
                  text: 'Enter',
                  size: 40,
                  weight: FontWeight.w600,
                  color: fydPGrey.withOpacity(.8),
                ),
                FydText.d1black(
                  text: 'verification code',
                  weight: FontWeight.w600,
                  color: fydPGrey.withOpacity(.8),
                ),
              ],
            ),
          ),
          //! sub-Heading: otp-field
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! subHeading
                  Center(
                    child: FydRichText(
                      size: 14,
                      weight: FontWeight.w600,
                      color: fydPGrey,
                      textList: [
                        const TextSpan(text: 'we have send you on +91 '),
                        TextSpan(
                          text:
                              Helpers.phoneMask(state.phoneNumber.getOrCrash()),
                          style: const TextStyle(
                              letterSpacing: .8,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: fydLogoBlue),
                        ),
                      ],
                    ),
                  ),
                  //! otp-Field
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: OtpField(pinController: otpController),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
  bottomSheetView(
    BuildContext context,
    PhoneLoginState state,
    ValueNotifier<String> otpText,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //! Send-OTP Btn
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: FydBtn(
            color: fydPGrey,
            height: 60.h,
            widget: (state.isSubmitting)
                ? const SpinKitWave(color: fydLogoBlue, size: 20.0)
                : FydText.h3custom(
                    text: 'Confirm Otp',
                    weight: FontWeight.w600,
                    color: (otpText.value.length != 6) ? fydTGrey : fydLogoBlue,
                  ),
            onPressed: () async {
              HapticFeedback.mediumImpact();
              // validate if otp
              if (otpText.value.length != 6) {
                showSnack(context: context, message: '6 digit otp expected');
              }
              // add confirmOtp event
              else {
                context.read<PhoneLoginBloc>().add(PhoneLoginEvent.confirmOtp(
                      otp: Otp(otpText.value),
                    ));
              }
            },
          ),
        ),
        //! company-name
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Image.asset(
            'assets/logo/fyd-tech.png',
            width: 200.w,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
//?-----------------------------------------------------------------------------

}
