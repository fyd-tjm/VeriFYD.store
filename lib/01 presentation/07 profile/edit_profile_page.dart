import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_loading_overlay.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_text_form_field.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

//?-----------------------------------------------------------------------------

class EditProfileWrapperPage extends StatelessWidget {
  const EditProfileWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: WillPopScope(
          onWillPop: () async {
            final popResult = await showPermissionDialog(
                context: context,
                title: 'Alert!',
                message: "Changes not saved. Yes to leave, Cancel to stay.",
                falseBtnTitle: 'Cancel',
                trueBtnTitle: 'Yes');
            return popResult ?? false;
          },
          child: EditProfilePage()),
    );
  }
}

//?-----------------------------------------------------------------------------
class EditProfilePage extends HookWidget {
  EditProfilePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final FydLoadingOverlay _loadingOverlay = getIt<FydLoadingOverlay>();

  @override
  Widget build(BuildContext context) {
    //-----
    final fydUserName = getIt<FydUserCubit>().state.fydUser!.name;
    final fydUserEmail = getIt<FydUserCubit>().state.fydUser!.email;
    //-----
    final nameController = useTextEditingController(text: fydUserName);
    final emailController = useTextEditingController(text: fydUserEmail);
    //-----
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocListener<FydUserCubit, FydUserState>(
          listener: (context, state) {
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                () => null,
                (userFailure) {
                  _loadingOverlay.hide();
                  //------
                  userFailure.fold(
                    (failure) => showSnack(
                      viewType: SnackBarViewType.withNav,
                      context: context,
                      message: failure.when(
                        aborted: () => 'Failed! try again',
                        invalidArgument: () => 'Invalid Argument: try again',
                        alreadyExists: () => 'Data already Exists',
                        notFound: () => 'Data not found!',
                        permissionDenied: () => 'Permission Denied',
                        serverError: () => 'Server Error: try again ',
                        unknownError: () => 'Something went wrong: try again ',
                      ),
                    ),
                    (success) => showSnack(
                        context: context,
                        viewType: SnackBarViewType.withNav,
                        message: 'success!'),
                  );
                  //------
                  context.navigateBack();
                },
              );
            }
            if (state.updating == true) {
              // loading overlay diolog
              _loadingOverlay.show(context);
            }
            if (state.updating == false) {
              // hide loading overlay
              _loadingOverlay.hide();
            }
          },
          child: FydView(
            pageViewType: ViewType.without_Nav_Bar,
            isScrollable: true,
            topSheetHeight: 300.h,
            topSheet: _topSheetView(context, nameController, emailController),
            bottomSheet: _bottomSheetView(context, nameController,
                emailController, fydUserName, fydUserEmail),
          ),
        ),
      ),
    );
  }
//?-Top-Sheet-View--------------------------------------------------------------

  _topSheetView(BuildContext context, TextEditingController nameController,
      TextEditingController emailController) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        //! AppBar (heading + close-Btn)
        FydAppBar(
          leading: AppBarBtn.close(
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.router.pop();
            },
          ),
          main: const Center(
            child: FydText.d3black(
              text: 'edit-Profile',
              letterSpacing: 1.3,
            ),
          ),
        ),
        //! EditForm (name + email)
        Expanded(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: FydTextFormField(
                      controller: nameController,
                      labelText: 'name:',
                      floatColor: fydPgrey,
                      keyboardType: TextInputType.visiblePassword,
                      onScrollPadding: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'name cannot be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: FydTextFormField(
                      controller: emailController,
                      labelText: 'em@il:',
                      floatColor: fydPgrey,
                      keyboardType: TextInputType.emailAddress,
                      onScrollPadding: false,
                      validator: (value) {
                        if (value!.isNotEmpty &&
                            Helpers.isValidEmail(value) == false) {
                          return 'enter valid email';
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
    );
  }

//?-Top-Sheet-View--------------------------------------------------------------

  _bottomSheetView(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      String fydUsername,
      String fydUseremail) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
      child: Column(
        children: [
          //! Updater btn
          FydBtn(
            color: fydSblack,
            height: 60.h,
            fydText: const FydText.h2custom(
              text: 'Update ',
              color: fydBblue,
              weight: FontWeight.w600,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                context.read<FydUserCubit>().updateUserInfo(
                      name: nameController.text,
                      email: emailController.text,
                    );
              }
            },
          )
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------