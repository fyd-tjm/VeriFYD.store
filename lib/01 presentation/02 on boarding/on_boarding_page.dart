import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/on%20boarding/on_boarding_cubit.dart';
import 'package:verifyd_store/03%20domain/auth/value_objects.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';

class OnBoardingWrapperPage extends StatelessWidget {
  const OnBoardingWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnBoardingCubit>(),
      child: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends HookWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
//?-----------------------------------------------------------------------------
//? Referenced Size (890, 400) // usable H 838.6
//? TopSheet H =>
//?-----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 350.h,
                width: double.infinity,
                // color: fydPDgrey,
                decoration: BoxDecoration(
                  color: fydPDgrey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FydText.d1white(
                              text: 'What',
                              weight: FontWeight.w100,
                            ),
                            FydText.d2white(
                              text: 'Should we call you',
                              weight: FontWeight.w100,
                            ),
                            FydText.h2black(
                              text: 'Transparent UI',
                              weight: FontWeight.w100,
                            ),
                            FydText.h2black(
                              text: 'Transparent UI',
                              weight: FontWeight.w100,
                            ),
                            FydText.h2black(
                              text: 'Transparent UI',
                              weight: FontWeight.w100,
                            ),
                            FydText.b3grey(
                                text: 'name will be used to place orders'),

                            //! name Textfield
                            Padding(
                              padding: EdgeInsets.only(
                                top: 25.h,
                                left: 25.w,
                                right: 25.w,
                              ),
                              child: SizedBox(
                                height: 50.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: nameField(nameController),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//! Finish Setup btn -- bloc Consumer
              BlocConsumer<OnBoardingCubit, OnBoardingState>(
                listener: (context, state) {
                  if (state.authFailureOrSuccessOption.isSome()) {
                    state.authFailureOrSuccessOption.fold(
                      () => null,
                      (some) => some.fold(
                        (authFailure) {
                          // error handling state
                          showSnack(
                              context: context,
                              message: authFailure.toString());
                        },
                        (success) {
                          // navigate if success state
                          showSnack(context: context, message: 'success!');
                          context.router.replaceNamed(Rn.landing);
                        },
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 20.h),
                            child: FydBtn(
                              widget: (state.isSubmitting == true)
                                  ? const SpinKitWave(
                                      color: fydPWhite, size: 20.0)
                                  : FydText.h1white(text: 'Finish setup'),
                              onPressed: () {
                                // return if loading
                                if (state.isSubmitting == true) return;
                                // check validation ..length > 0
                                if (nameController.value.text.isEmpty) {
                                  showSnack(
                                      context: context,
                                      durationSeconds: 2,
                                      message: 'name must not be empty');
                                } else {
                                  FocusScope.of(context).unfocus();
                                  // call createUser Event
                                  context.read<OnBoardingCubit>().addUserName(
                                        userName: UserName(nameController.text),
                                      );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
TextField nameField(TextEditingController nameController) {
  return TextField(
    keyboardType: TextInputType.name,
    autofocus: true,
    textCapitalization: TextCapitalization.characters,
    controller: nameController,
    // text Styling
    style: TextStyle(
        color: fydTWhite,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        fontSize: 26.sp,
        decoration: TextDecoration.none,
        decorationColor: fydPLgrey),
    textAlign: TextAlign.center,
    showCursor: false,
    maxLength: 15,

    // textfield styling
    decoration: InputDecoration(
      hintText: 'N-A-M-E',
      contentPadding: EdgeInsets.all(8.h),
      // to hide max length counter
      counterText: '',
      hintStyle: TextStyle(
        color: fydPLgrey,
        fontSize: 26.sp,
        letterSpacing: 3.0,
      ),
      fillColor: fydPGrey.withOpacity(.9),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
//?-----------------------------------------------------------------------------



