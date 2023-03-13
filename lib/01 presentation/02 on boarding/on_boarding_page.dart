import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/on%20boarding/on_boarding_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

//?-----------------------------------------------------------------------------
class OnBoardingWrapperPage extends StatelessWidget {
  const OnBoardingWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnBoardingCubit>(),
      child: OnBoardingPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class OnBoardingPage extends HookWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final _formKey1 = GlobalKey<FormState>();

//?-----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    //--------
    log(context.router.currentUrl);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    //---------
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state.authFailureOrSuccessOption.isSome()) {
              state.authFailureOrSuccessOption.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                        (failure) => showSnack(
                            context: context,
                            message: failure.whenOrNull(
                              aborted: () => 'something went wrong! try again',
                              invalidArgument: null,
                              alreadyExists: null,
                              notFound: null,
                              permissionDenied: () => 'permission Denied.',
                              serverError: () => 'server error! try again',
                              unknownError: () =>
                                  'something went wrong! try again',
                            )),
                        (success) {
                          FocusScope.of(context).unfocus();
                          context.router.replaceAll([const MainWrapperRoute()]);
                        },
                      ));
            }
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 380.h,
              topSheetColor: fydPDgrey,
              topSheet: _topSheetView(context, nameController, emailController),
              bottomSheet:
                  _bottomSheet(context, nameController, emailController, state),
            );
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //! Input-Fields
          Expanded(
            child: Form(
              key: _formKey1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.h, left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //! nameField
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: FydTextFormField(
                        controller: nameController,
                        color: TextFieldColor.light,
                        autoFocus: true,
                        textCapitalization: TextCapitalization.words,
                        labelText: 'name:',
                        floatColor: fydLogoBlue,
                        labelColor: fydLogoBlue,
                        textAlign: TextAlign.start,
                        maxLength: 35,
                        letterSpacing: 1.5,
                        labelSize: 16,
                        keyboardType: TextInputType.visiblePassword,
                        onScrollPadding: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name cannot be empty.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    //! email
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: FydTextFormField(
                        controller: emailController,
                        color: TextFieldColor.light,
                        labelText: 'em@il:',
                        floatColor: fydLogoBlue,
                        labelColor: fydLogoBlue,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 35,
                        letterSpacing: 1.5,
                        labelSize: 16,
                        onScrollPadding: false,
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              Helpers.isValidEmail(value) == false) {
                            return 'enter a valid email.';
                          } else if (value.isEmpty) {
                            return 'email cannot be empty.';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheet(BuildContext context, TextEditingController nameController,
      TextEditingController emailController, OnBoardingState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! [Get-Started] btn
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: FydBtn(
            color: fydPGrey,
            height: 60.h,
            widget: (state.isSubmitting == true)
                ? const SpinKitWave(color: fydLogoBlue, size: 20.0)
                : FydText.h3custom(
                    text: 'Get Started',
                    weight: FontWeight.w600,
                    color: (nameController.text.isEmpty &&
                            emailController.text.isEmpty)
                        ? fydTGrey
                        : fydLogoBlue,
                  ),
            onPressed: () async {
              HapticFeedback.mediumImpact();
              // validate fields
              if (_formKey1.currentState!.validate()) {
                context.read<OnBoardingCubit>().addUserName(
                    name: nameController.text, email: emailController.text);
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

//?-----------------------------------------------------------------------------
