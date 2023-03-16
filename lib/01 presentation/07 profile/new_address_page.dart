import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../02 application/fyd user/fyd_user_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../00 core/widgets/00_core_widgets_export.dart';
import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------

class NewAddressWrapperPage extends StatelessWidget {
  const NewAddressWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FydUserCubit>(),
        ),
        BlocProvider.value(
          value: getIt<SharedInfoCubit>(),
        ),
      ],
      child: WillPopScope(
          onWillPop: () async {
            final popResult = await showPermissionDialog(
                context: context,
                message: " Changes not saved. Cancel to stay, Yes to leave.",
                title: 'Alert!',
                falseBtnTitle: 'Cancel',
                trueBtnTitle: 'Yes');
            return popResult ?? false;
          },
          child: NewAddressPage()),
    );
  }
}

//?-----------------------------------------------------------------------------

class NewAddressPage extends HookWidget {
  NewAddressPage({Key? key}) : super(key: key);

//------
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final FydLoadingOverlay _loadingOverlay = getIt<FydLoadingOverlay>();
//------

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    //------
    final fydUserName = getIt<FydUserCubit>().state.fydUser!.name;
    final fydUserPhone = getIt<FydUserCubit>().state.fydUser!.phone;
    final fydUserEmail = getIt<FydUserCubit>().state.fydUser!.email;
    //-------
    final nameController = useTextEditingController(text: fydUserName);
    final phoneController =
        useTextEditingController(text: Helpers.getLast10Digits(fydUserPhone));
    final emailController = useTextEditingController(text: fydUserEmail);
    final line1Controller = useTextEditingController();
    final line2Controller = useTextEditingController();
    final landmarkController = useTextEditingController();
    final cityController = useTextEditingController();
    final pincodeController = useTextEditingController();
    final addressState = useState<String?>(null);
    //-------
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<FydUserCubit, FydUserState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/newAddress') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                () => null,
                (userFailure) {
                  _loadingOverlay.hide();
                  //------
                  userFailure.fold(
                    (failure) => showSnack(
                      viewType: SnackBarViewType.withoutNav,
                      context: context,
                      message: failure.when(
                        aborted: () => 'Failed! try again later',
                        invalidArgument: () => 'Invalid Argument. try again',
                        alreadyExists: () => 'Data already Exists',
                        notFound: () => 'Data not found!',
                        permissionDenied: () => 'Permission Denied',
                        serverError: () => 'Server Error. try again later',
                        unknownError: () =>
                            'Something went wrong. try again later',
                      ),
                    ),
                    (success) => showSnack(
                        context: context,
                        viewType: SnackBarViewType.withoutNav,
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
            isScrollable: false,
            topSheetHeight: 340.h,
            topSheet: _topSheetView(
              context,
              nameController,
              phoneController,
              emailController,
            ),
            bottomSheet: _bottomSheetView(
              context,
              nameController,
              phoneController,
              emailController,
              line1Controller,
              line2Controller,
              landmarkController,
              cityController,
              pincodeController,
              addressState,
            ),
          ),
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController phoneController,
      TextEditingController emailController) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        //! AppBar (heading + close-Btn )
        FydAppBar(
          leading: AppBarBtn(
            iconData: Icons.close_rounded,
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.router.pop();
            },
          ),
          main: const Center(
            child: FydText.d3black(
              text: 'new-Address',
              letterSpacing: 1.3,
            ),
          ),
        ),
        //! EditForm (name + phone + email)
        Expanded(
          child: Form(
            key: _formKey1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //! name
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'name:',
                      floatColor: fydPgrey,
                      maxLength: 30,
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
                  //! phone
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: phoneController,
                      labelText: 'phone: (+91) ',
                      floatColor: fydPgrey,
                      isDigitOnly: true,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      onScrollPadding: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'phone cannot be empty';
                        } else if (value.length < 10) {
                          return 'phone number must be 10 digit long';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  //! email
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: emailController,
                      labelText: 'em@il:',
                      floatColor: fydPgrey,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 30,
                      onScrollPadding: false,
                      validator: (value) {
                        if (value!.isNotEmpty &&
                            Helpers.isValidEmail(value) == false) {
                          return 'enter valid email';
                        } else if (value.isEmpty) {
                          return 'enter email';
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

//?-----------------------------------------------------------------------------
  _bottomSheetView(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController emailController,
    TextEditingController line1Controller,
    TextEditingController line2Controller,
    TextEditingController landmarkController,
    TextEditingController cityController,
    TextEditingController pincodeController,
    ValueNotifier<String?> addressState,
  ) {
    final statesList = context.select(
        (SharedInfoCubit cubit) => cubit.state.sharedInfo!.deliveryStates);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20.h,
          left: 10.w,
          right: 10.w,
        ),
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! address: line 1
              FydTextFormField(
                color: TextFieldColor.light,
                controller: line1Controller,
                labelText: 'address line 1:',
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
                maxLength: 40,
                onScrollPadding: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              //! address: line 2
              FydTextFormField(
                color: TextFieldColor.light,
                controller: line2Controller,
                labelText: 'address line 2:',
                maxLength: 40,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
                onScrollPadding: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              //! Landmark
              FydTextFormField(
                color: TextFieldColor.light,
                controller: landmarkController,
                labelText: 'landmark (optional)',
                maxLength: 45,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
                onScrollPadding: true,
                validator: (value) => null,
              ),
              SizedBox(
                height: 20.h,
              ),
              //! city + pincode
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! city
                  SizedBox(
                    width: 220.w,
                    child: FydTextFormField(
                      color: TextFieldColor.light,
                      controller: cityController,
                      labelText: 'city: ',
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.words,
                      maxLength: 40,
                      onScrollPadding: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter city ';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  //! pincode
                  SizedBox(
                    width: 150.w,
                    child: FydTextFormField(
                      color: TextFieldColor.light,
                      controller: pincodeController,
                      labelText: 'pincode: ',
                      isDigitOnly: true,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      onScrollPadding: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter pin';
                        } else if (value.length < 6) {
                          return '6 digit pin';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              //! state-drp-dwn-menu
              AddressDropdownMenu(
                list: statesList,
                startValue: addressState.value,
                onSelect: (value) {
                  addressState.value = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'select state';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              //! save-btn
              FydBtn(
                color: fydSblack,
                height: 55.h,
                fydText: const FydText.h2custom(
                  text: 'save  💾',
                  weight: FontWeight.w600,
                  color: fydBblue,
                ),
                onPressed: () async {
                  HapticFeedback.mediumImpact();
                  if (_formKey1.currentState!.validate() &&
                      _formKey2.currentState!.validate()) {
                    // call add-address-Event
                    FocusScope.of(context).unfocus();
                    await context.read<FydUserCubit>().addNewAddress(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          al1: line1Controller.text,
                          al2: line2Controller.text,
                          landmark: landmarkController.text,
                          city: cityController.text,
                          pincode: int.parse(pincodeController.text),
                          addressState: addressState.value!,
                        );
                  }
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}

//?-----------------------------------------------------------------------------
