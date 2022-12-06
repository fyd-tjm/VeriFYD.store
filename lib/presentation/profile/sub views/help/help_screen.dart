import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_heading_with_back_btn.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

import '../../../../utils/router/routes.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydPageView(
        pageViewType: PageViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 150.h,
        topSheet: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FydHeadingWithBackBtn(
              heading: 'Help',
              onBackPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
            ),
            FydText.b1black(
              text: 'having issues, reach us via',
              weight: FontWeight.bold,
            ).paddingOnly(bottom: 20.h),
          ],
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
          child: Column(
            children: [
              HelpCard(
                  icon: SvgPicture.asset(
                    'assets/icons/whatsapp.svg',
                    fit: BoxFit.contain,
                  ),
                  heading: 'Whatsapp support. Quick resolution',
                  subHeading: '(recommended)',
                  onPressed: () {}),
              HelpCard(
                  icon: const Icon(
                    Icons.contact_phone_outlined,
                    size: 40,
                    color: fydNotifGreen,
                  ),
                  heading: '  Call us between    9:00 -- 21:00',
                  subHeading: '+91 5989265989    +91 4564568468',
                  onPressed: () {}),
              HelpCard(
                  icon: const Icon(
                    Icons.mail_rounded,
                    size: 40,
                    color: fydSBlue,
                  ),
                  heading: 'Mail us at',
                  subHeading: 'verifyd@gmail.com',
                  onPressed: () {}),
            ],
          ),
        ));
  }
}

class HelpCard extends StatelessWidget {
  final Widget icon;
  final String heading;
  final String subHeading;
  final VoidCallback onPressed;
  const HelpCard({
    Key? key,
    required this.icon,
    required this.heading,
    required this.subHeading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: fydPDgrey,
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Card(
          color: fydPGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              SizedBox(
                height: 60.h,
                width: 60.h,
                child: icon.paddingOnly(left: 20.h),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FydText.b3white(
                    text: heading,
                    weight: FontWeight.bold,
                  ),
                  FydText.b3white(text: subHeading).paddingOnly(top: 5.h)
                ],
              ).paddingOnly(left: 15.w)
            ],
          ),
        ),
      ).paddingOnly(bottom: 20.h),
    );
  }
}
