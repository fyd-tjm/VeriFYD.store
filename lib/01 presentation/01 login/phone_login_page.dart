// ignore_for_file: non_constant_identifier_names
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import '../../00 ui-core/ui_exports.dart';

//?-----------------------------------------------------------------------------
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

//?-----------------------------------------------------------------------------
class PhoneLoginPage extends HookWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    //--------
    final phoneText = useState('');
    final phoneController = useTextEditingController();
    final update = useValueListenable(phoneController);
    useEffect(() {
      phoneText.value = update.text;
      return;
    }, [update]);
    //---------
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: fydPDgrey,
        body: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
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
                              sessionExpired: () =>
                                  'session Expired: try again',
                              userDisabled: () => 'user is disabled',
                              tooManyRequests: () =>
                                  'too Many Requests: try again',
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
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 380.h,
              topSheet: topSheetView(context, phoneController),
              bottomSheet: bottomSheetView(context, state, phoneText),
            );
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  topSheetView(
    BuildContext context,
    TextEditingController phoneController,
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
        child: Padding(
          padding:
              EdgeInsets.only(top: 0.h, left: 20.w, right: 20.w, bottom: 0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              //! Heading
              Padding(
                padding: EdgeInsets.only(top: 100.h),
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
                      text: 'mobile number',
                      weight: FontWeight.w600,
                      color: fydPGrey.withOpacity(.8),
                    ),
                  ],
                ),
              ),

              //! subHeading: PhoneField
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  children: [
                    //! subHeading
                    const Center(
                      child: FydText.b4black(
                        text: 'we will send you a confirmation code',
                        weight: FontWeight.w600,
                      ),
                    ),
                    //! Phonenumber-Field
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 15.w, right: 15.w, bottom: 0.h),
                      child: FydTextFormField(
                        controller: phoneController,
                        labelText: '(+91)',
                        autoFocus: true,
                        isDigitOnly: true,
                        floatColor: fydLogoBlue,
                        labelColor: fydLogoBlue,
                        maxLength: 10,
                        letterSpacing: 4,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        keyboardAction: TextInputAction.none,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

//?-----------------------------------------------------------------------------
  bottomSheetView(
    BuildContext context,
    PhoneLoginState state,
    ValueNotifier<String> phoneText,
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
                    text: 'Send Otp',
                    weight: FontWeight.w600,
                    color:
                        (phoneText.value.length != 10) ? fydTGrey : fydLogoBlue,
                  ),
            onPressed: () async {
              HapticFeedback.mediumImpact();
              // number validation
              if (phoneText.value.length != 10) {
                showSnack(context: context, message: 'enter 10 digit number');
              }
              // sendOtpEvent
              else {
                context.read<PhoneLoginBloc>().add(PhoneLoginEvent.sendOtp(
                      phoneNumber: PhoneNumber(phoneText.value),
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
