import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/on%20boarding/on_boarding_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../00 core/widgets/00_core_widgets_export.dart';

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
//? Referenced Size (890, 400) // usable H 838.6
//? TopSheet H =>
//?-----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 300.h,
          topSheet: _topSheetView(context, nameController, emailController),
          bottomSheet: _bottomSheet(context, nameController, emailController),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
          child: FydText.d3custom(text: 'Final Step', color: fydPDgrey),
        ),
        Expanded(
          child: Form(
            key: _formKey1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // name
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'name:',
                      maxLength: 35,
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

                  // email
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: emailController,
                      labelText: 'em@il:',
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 35,
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
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
          child: FydText.b3custom(
            text: 'can be change later as well',
            color: fydBlueGrey,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheet(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
  ) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
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
                          permissionDenied: () => 'Permission Denied',
                          serverError: () => 'server Error',
                          unknownError: () => 'something went wrong! try again',
                        )),
                    (success) => context.router
                        .replaceAll([const LandingWrapperRoute()]),
                  ));
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! Finish Setup btn
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
              child: FydBtn(
                color: fydPGrey,
                height: 60.h,
                widget: (state.isSubmitting == true)
                    ? const SpinKitWave(color: fydPWhite, size: 20.0)
                    : FydText.h1white(text: 'Finish setup'),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  if (_formKey1.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    context.read<OnBoardingCubit>().addUserName(
                        name: nameController.text, email: emailController.text);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

//?-----------------------------------------------------------------------------
}

//?-----------------------------------------------------------------------------



