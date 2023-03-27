// ignore_for_file: non_constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_network_dialog.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_text_form_field.dart';
import 'package:verifyd_store/02%20application/phone%20login/phone_login_bloc.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';

import '../../02 application/core/network/network_cubit.dart';

//?-----------------------------------------------------------------------------
class PhoneLoginWrapperPage extends StatelessWidget {
  PhoneLoginWrapperPage({Key? key}) : super(key: key);

  final FydNetworkDialog _networkDialog = getIt<FydNetworkDialog>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PhoneLoginBloc>(),
        ),
        BlocProvider.value(
          value: getIt<NetworkCubit>(),
        ),
      ],
      child: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state.isNetworkAvailable == false) {
            _networkDialog.show(context);
          } else {
            _networkDialog.hide();
          }
        },
        child: const AutoRouter(),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class PhoneLoginPage extends HookWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //--------
    final phoneText = useState('');
    final phoneController = useTextEditingController();
    final update = useValueListenable(phoneController);
    useEffect(() {
      phoneText.value = update.text;
      return;
    }, [update]);
    //---------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<PhoneLoginBloc, PhoneLoginState>(
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
                        (success) => null,
                      ));
            }
            if (state.isCodeSent) {
              context.router.pushNamed('otp');
            }
          },
          buildWhen: (previous, current) {
            if (context.router.currentUrl == '/login') {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 380.h,
              topSheet: _TopSheet(phoneController: phoneController),
              bottomSheet: _BottomSheet(state: state, phoneText: phoneText),
            );
          },
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class _TopSheet extends StatelessWidget {
  final TextEditingController phoneController;
  const _TopSheet({
    // super.key,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          // background Image
          image: DecorationImage(
            image: AssetImage(
              AssetHelper.verifydStore_bg,
            ),
            fit: BoxFit.scaleDown,
            alignment: Alignment.topRight,
            opacity: .5,
            filterQuality: FilterQuality.high,
          ),
        ),
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
                  children: const [
                    FydText.d1black(
                      text: 'Enter',
                      size: 40,
                      weight: FontWeight.w600,
                    ),
                    FydText.d1black(
                      text: 'mobile number',
                      weight: FontWeight.w600,
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
                        floatColor: fydBblue,
                        labelColor: fydBblue,
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
}

//?-----------------------------------------------------------------------------
class _BottomSheet extends StatelessWidget {
  final PhoneLoginState state;
  final ValueNotifier<String> phoneText;
  const _BottomSheet({
    required this.state,
    required this.phoneText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        //! Send-OTP Btn
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: FydBtn(
            color: fydSblack,
            height: 60.h,
            widget: (state.isSubmitting)
                ? const SpinKitWave(color: fydBblue, size: 20.0)
                : FydText.h3custom(
                    text: 'Send Otp',
                    weight: FontWeight.w600,
                    color: (phoneText.value.length != 10) ? fydPgrey : fydBblue,
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
            AssetHelper.verifydStore_logoWithName,
            width: 180.w,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}
