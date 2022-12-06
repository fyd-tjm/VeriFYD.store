import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/application/auth/sign_in_controller.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';

final TextEditingController nameController = TextEditingController();

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // summation of all widgets heigt must be 640-(24) => 616
    // ScreenUtil.init(
    //   context,
    //   designSize: const Size(360, 640),
    //   minTextAdapt: true,
    // );

    return SafeArea(
      child: Scaffold(
        backgroundColor: fydPWhite,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 260.h,
                width: double.infinity,
                // color: fydPDgrey,
                decoration: BoxDecoration(
                  color: fydPDgrey,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.r),
                    bottomLeft: Radius.circular(30.r),
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
                            FydText.b3white(
                                text: 'name will be used to place the order'),
//! name Textfield
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 25.w,
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
//! Finish Setup btn
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: FydBtn(
                          fydText: FydText.h1white(text: 'Finish setup'),
                          onPressed: () {
                            SignInController.i.userName.value =
                                UserName(nameController.text);
                            SignInController.i.finishSetupPressed();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
        fillColor: fydPGrey.withOpacity(.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
