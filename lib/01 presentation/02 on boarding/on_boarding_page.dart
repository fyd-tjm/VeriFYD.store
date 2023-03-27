import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_text_form_field.dart';
import 'package:verifyd_store/02%20application/on%20boarding/on_boarding_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../02 application/core/network/network_cubit.dart';
import '../../utils/helpers/asset_helper.dart';
import '../00 core/widgets/fyd_network_dialog.dart';

//?-----------------------------------------------------------------------------
class OnBoardingWrapperPage extends StatelessWidget {
  OnBoardingWrapperPage({Key? key}) : super(key: key);
  final FydNetworkDialog _networkDialog = getIt<FydNetworkDialog>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<OnBoardingCubit>(),
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
        child: OnBoardingPage(),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
class OnBoardingPage extends HookWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //--------
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    //---------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
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
                          context.router.replaceAll([LandingWrapperRoute()]);
                        },
                      ));
            }
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetColor: fydPblack,
              topSheetHeight: 380.h,
              topSheet: _TopSheet(
                  formKey1: _formKey1,
                  nameController: nameController,
                  emailController: emailController),
              bottomSheet: _BottomSheet(
                  formKey1: _formKey1,
                  nameController: nameController,
                  emailController: emailController,
                  state: state),
            );
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  const _TopSheet({
    required GlobalKey<FormState> formKey1,
    required this.nameController,
    required this.emailController,
  }) : _formKey1 = formKey1;

  final GlobalKey<FormState> _formKey1;

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
                        floatColor: fydBblue,
                        labelColor: fydBblue,
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
                        floatColor: fydBblue,
                        labelColor: fydBblue,
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
}
//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final OnBoardingState state;
  const _BottomSheet({
    required GlobalKey<FormState> formKey1,
    required this.nameController,
    required this.emailController,
    required this.state,
  }) : _formKey1 = formKey1;

  final GlobalKey<FormState> _formKey1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! [Get-Started] btn
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: FydBtn(
            color: fydSblack,
            height: 60.h,
            widget: (state.isSubmitting == true)
                ? const SpinKitWave(color: fydBblue, size: 20.0)
                : FydText.h3custom(
                    text: 'Get Started',
                    weight: FontWeight.w600,
                    color: (nameController.text.isEmpty &&
                            emailController.text.isEmpty)
                        ? fydPgrey
                        : fydBblue,
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
            AssetHelper.verifydStore_logoWithName,
            width: 180.w,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}
