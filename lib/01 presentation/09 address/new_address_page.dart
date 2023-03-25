import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_app_bar.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_text_form_field.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import 'widgets/address_drop_down_menu.dart';

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
    final statesList = context.select(
        (SharedInfoCubit cubit) => cubit.state.sharedInfo!.deliveryStates);
    //-------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocListener<FydUserCubit, FydUserState>(
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
                        aborted: () => 'Failed! try again',
                        invalidArgument: () => 'Invalid Argument: try again',
                        alreadyExists: () => 'Data already Exists',
                        notFound: () => 'Data not found!',
                        permissionDenied: () => 'Permission Denied',
                        serverError: () => 'Server Error: try again',
                        unknownError: () => 'Something went wrong: try again',
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //! AppBar (heading + close-Btn )
                FydAppBar(
                  leading: AppBarBtn.back(
                    iconColor: fydPwhite,
                    padding: EdgeInsets.only(top: 8.h),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.router.pop();
                    },
                  ),
                  main: const Center(
                    child: FydText.h1custom(
                      text: 'new-Address',
                      letterSpacing: 1.3,
                      weight: FontWeight.w600,
                      color: fydBbluegrey,
                    ),
                  ),
                ),
                //! Form1 (name + phone + email)
                _TopForm(
                    formKey1: _formKey1,
                    nameController: nameController,
                    phoneController: phoneController,
                    emailController: emailController),
                //! divider
                const FydDivider(),
                //! Form2 (address fields)
                _BottomForm(
                    formKey2: _formKey2,
                    line1Controller: line1Controller,
                    line2Controller: line2Controller,
                    landmarkController: landmarkController,
                    cityController: cityController,
                    pincodeController: pincodeController,
                    statesList: statesList,
                    addressState: addressState,
                    formKey1: _formKey1,
                    nameController: nameController,
                    phoneController: phoneController,
                    emailController: emailController),
                //! divider
                const FydDivider(),
                //! save-btn
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  child: FydBtn(
                    color: fydSblack,
                    height: 60.h,
                    fydText: const FydText.h3custom(
                      text: 'Save',
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
                ),
                // extra height
                SizedBox(
                  height: 300.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopForm extends StatelessWidget {
  const _TopForm({
    super.key,
    required GlobalKey<FormState> formKey1,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
  }) : _formKey1 = formKey1;

  final GlobalKey<FormState> _formKey1;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! name
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: FydTextFormField(
                controller: nameController,
                color: TextFieldColor.light,
                labelText: 'name:',
                floatColor: fydPgrey,
                inputColor: fydPwhite,
                maxLength: 30,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
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
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: FydTextFormField(
                controller: phoneController,
                color: TextFieldColor.light,
                labelText: 'phone: (+91) ',
                floatColor: fydPgrey,
                inputColor: fydPwhite,
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
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: FydTextFormField(
                controller: emailController,
                color: TextFieldColor.light,
                inputColor: fydPwhite,
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
    );
  }
}

//?-----------------------------------------------------------------------------

class _BottomForm extends StatelessWidget {
  const _BottomForm({
    super.key,
    required GlobalKey<FormState> formKey2,
    required this.line1Controller,
    required this.line2Controller,
    required this.landmarkController,
    required this.cityController,
    required this.pincodeController,
    required this.statesList,
    required this.addressState,
    required GlobalKey<FormState> formKey1,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
  }) : _formKey2 = formKey2;

  final GlobalKey<FormState> _formKey2;
  final TextEditingController line1Controller;
  final TextEditingController line2Controller;
  final TextEditingController landmarkController;
  final TextEditingController cityController;
  final TextEditingController pincodeController;
  final List<String> statesList;
  final ValueNotifier<String?> addressState;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! address: line 1
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: FydTextFormField(
                controller: line1Controller,
                color: TextFieldColor.light,
                labelText: 'address line 1:',
                inputColor: fydPwhite,
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
            ),

            //! address: line 2
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: FydTextFormField(
                color: TextFieldColor.light,
                controller: line2Controller,
                labelText: 'address line 2:',
                inputColor: fydPwhite,
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
            ),

            //! Landmark
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: FydTextFormField(
                color: TextFieldColor.light,
                controller: landmarkController,
                labelText: 'landmark (optional)',
                inputColor: fydPwhite,
                maxLength: 45,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
                onScrollPadding: true,
                validator: (value) => null,
              ),
            ),

            //! city + pincode
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! city
                  SizedBox(
                    width: 220.w,
                    child: FydTextFormField(
                      color: TextFieldColor.light,
                      controller: cityController,
                      inputColor: fydPwhite,
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
                      inputColor: fydPwhite,
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
            ),

            //! state-drp-dwn-menu
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: AddressDropdownMenu(
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
            ),
          ],
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
