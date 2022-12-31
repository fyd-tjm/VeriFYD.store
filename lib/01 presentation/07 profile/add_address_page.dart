import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../02 application/fyd user/fyd_user_cubit.dart';
import '../../aa mock/static_ui.dart';
import '../../utils/helpers/helpers.dart';
import '../00 core/widgets/00_core_widgets_export.dart';
import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------

class AddAddressWrapperPage extends StatelessWidget {
  const AddAddressWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: AddAddressPage(),
    );
  }
}

//?-----------------------------------------------------------------------------

class AddAddressPage extends HookWidget {
  AddAddressPage({Key? key}) : super(key: key);

//------
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final FydLoadingOverlay _loadingOverlay = getIt<FydLoadingOverlay>();
//------

  @override
  Widget build(BuildContext context) {
    //------
    final fydUserName =
        context.select((FydUserCubit cubit) => cubit.state.fydUser!.name);
    final fydUserPhone =
        context.select((FydUserCubit cubit) => cubit.state.fydUser!.phone);
    final fydUserEmail =
        context.select((FydUserCubit cubit) => cubit.state.fydUser!.email);
    //-------
    final nameController = useTextEditingController(text: fydUserName);
    final phoneController =
        useTextEditingController(text: Helpers.getLast10Digits(fydUserPhone));
    final emailController = useTextEditingController(text: fydUserEmail);
    final line1Controller = useTextEditingController();
    final line2Controller = useTextEditingController();
    final cityController = useTextEditingController();
    final pincodeController = useTextEditingController();
    final addressState = useState<String?>(null);
    //-------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: fydPDgrey,
      body: SafeArea(
        child: BlocListener<FydUserCubit, FydUserState>(
          listener: (context, state) {
            //  implement listener
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
              //TODO: back navigation
              onPressed: () {},
            ),
          ),
          main: Center(
            child: FydText.d2black(text: 'new-Address'),
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
                  // name
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'name:',
                      maxLength: 25,
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
                  // phone
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: phoneController,
                      labelText: 'phone: (+91) ',
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
                  // email
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: FydTextFormField(
                      controller: emailController,
                      labelText: 'em@il:',
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
    TextEditingController cityController,
    TextEditingController pincodeController,
    ValueNotifier<String?> addressState,
  ) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 25.h,
            left: 10.w,
            right: 10.w),
        child: Form(
          key: _formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // address: line 1
              FydTextFormField(
                color: TextFieldColor.Light,
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
              // address: line 2
              FydTextFormField(
                color: TextFieldColor.Light,
                controller: line2Controller,
                labelText: 'address line 2: (optional)',
                maxLength: 40,
                keyboardType: TextInputType.visiblePassword,
                textCapitalization: TextCapitalization.words,
                onScrollPadding: true,
                validator: (value) => null,
              ),
              SizedBox(
                height: 20.h,
              ),
              // city + pincode
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // city
                  SizedBox(
                    width: 220.w,
                    child: FydTextFormField(
                      color: TextFieldColor.Light,
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
                  // pincode
                  SizedBox(
                    width: 150.w,
                    child: FydTextFormField(
                      color: TextFieldColor.Light,
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
              // state-drp-dwn-menu
              AddressDropdownMenu(
                list: MockUi.states,
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
                height: 50.h,
              ),
              // save-btn
              FydBtn(
                color: fydGreyWhite,
                height: 55.h,
                fydText: FydText.h1black(
                  text: 'Save',
                  weight: FontWeight.w700,
                ),
                //TODO: call add Address event
                onPressed: () async {
                  HapticFeedback.mediumImpact();
                  // forms validation
                  if (_formKey1.currentState!.validate() &&
                      _formKey2.currentState!.validate()) {
                    // call add-address-Event
                    await context.read<FydUserCubit>().addNewAddress(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                          al1: line1Controller.text,
                          al2: line2Controller.text,
                          city: cityController.text,
                          pincode: int.parse(pincodeController.text),
                          addressState: addressState.value!,
                        );
                  }
                },
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
