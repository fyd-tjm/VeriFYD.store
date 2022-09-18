import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:phone_auth/screens/home_page.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // summation of all widgets heigt must be 640-(24) => 616
    ScreenUtil.init(
      context,
      designSize: const Size(360, 640),
      minTextAdapt: true,
    );
    TextEditingController _nameController = TextEditingController();
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
                            FydText.b4white(
                                text: 'name will be used to place the order'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 25.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _nameController,
                                      style: TextStyle(
                                          color: fydPWhite,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 3,
                                          fontSize: 26.sp,
                                          decoration: TextDecoration.none,
                                          decorationColor: fydPDgrey),
                                      textAlign: TextAlign.center,
                                      showCursor: false,
                                      maxLength: 12,
                                      decoration: InputDecoration(
                                        hintText: 'N-A-M-E',
                                        counterText: '',
                                        hintStyle: TextStyle(
                                          color: fydPLgrey,
                                          fontSize: 26.sp,
                                          letterSpacing: 3.0,
                                        ),
                                        fillColor: fydPGrey.withOpacity(.0),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                            Get.offAll(
                              () => const HomePage(),
                              curve: Curves.easeIn,
                              transition: Transition.rightToLeft,
                            );
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
}
