import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/core/ui%20controller/home_root_nav_controller.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydPageView(
        pageViewType: PageViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 500.h,
        topSheet: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! confirmation heading
            FydText.d1black(text: 'Confirmation').paddingOnly(top: 15.h),
            //! gif
            Image.network(MockUi.confirmGif,
                height: 220.h,
                fit: BoxFit.contain,
                scale: 1,
                repeat: ImageRepeat.noRepeat),
            FydText.h1black(text: 'Congrats!'),
            FydText.b3black(
              text: 'Your order request has been placed successfully.',
              weight: FontWeight.bold,
            ).paddingOnly(top: 30.h),
            FydText.b3black(
              text: 'You can track it in your orders.',
              weight: FontWeight.bold,
            ).paddingOnly(top: 5.h),
            //! go to orders btn
            FydBtn(
                    height: 60.h,
                    color: fydPGrey,
                    fydText: FydText.h2white(text: 'Go To Orders'),
                    onPressed: () {})
                .paddingSymmetric(horizontal: 20.w, vertical: 25.h),
          ],
        ),
        bottomSheet: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! take me home btn
            FydBtn(
                height: 60.h,
                color: fydPGrey,
                fydText: FydText.h2white(text: 'Take Me Home'),
                onPressed: () {
                  HomeRootNavController.i.activeIndex.value = 0;
                  Get.back();
                }).paddingSymmetric(horizontal: 20.w),
          ],
        ));
  }
}
