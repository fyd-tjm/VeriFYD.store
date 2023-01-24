import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
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
                message:
                    " Changes not saved. Leave page? Press Yes to leave, Cancel to stay.",
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
      backgroundColor: fydPDgrey,
      body: SafeArea(
        child: BlocListener<FydUserCubit, FydUserState>(
          listener: (context, state) {
            // implement listener
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                  // in case of failure: snackBar
                  (userFailure) => null,
                  //! in case of success
                  (success) {
                    _loadingOverlay.hide();
                    context.navigateBack();
                  },
                ),
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
          leading: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  primary: fydPDgrey),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Icon(
                  Icons.close_rounded,
                  size: 25.w,
                  color: fydPWhite,
                ),
              ),
              //! close navigation
              onPressed: () {
                context.router.pop();
              },
            ),
          ),
          main: Center(
            child: FydText.d2black(text: 'edit-Profile'),
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          //! Updater btn
          FydBtn(
            color: fydPGrey,
            height: 60.h,
            fydText: FydText.h1white(
              text: 'Update',
              weight: FontWeight.w600,
            ),
            onPressed: () {
              // form validation
              if (_formKey.currentState!.validate()) {
                // update call
                //-----
                final updatedName = nameController.text;
                final updatedEmail = emailController.text;
                //-----
                context
                    .read<FydUserCubit>()
                    .updateUserInfo(name: updatedName, email: updatedEmail);
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