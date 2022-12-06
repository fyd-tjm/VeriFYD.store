import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/application/stores/store_ui_controller.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_dropdown_section.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';

import '../../../../../utils/router/routes.dart';
import '../widgets/store_name_header.dart';

// ignore: must_be_immutable
class StoreInfoScreen extends StatelessWidget {
  StoreInfoScreen({Key? key}) : super(key: key);
  final _uiController = StoreUiController.i;
  @override
  Widget build(BuildContext context) {
    return FydPageView(
      pageViewType: PageViewType.without_Nav_Bar,
      isScrollable: true,
      topSheetHeight: 180.h,
      topSheet: Column(
        children: [
          //! StoreHeading + Rating + back
          Stack(
            alignment: Alignment.center,
            children: [
              //! StoreHeading
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StoreNameHeader(
                      storeName: _uiController.store.name,
                    ),
                  ],
                ),
              ),
              //! Rating
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_outlined,
                      size: 20.sp,
                    ),
                    FydText.b3black(
                        text: _uiController.store.rating.toString()),
                  ],
                ).paddingOnly(top: 6.sp),
              ).paddingOnly(right: 15.w),
              //! back btn
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      primary: fydPDgrey),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 25.sp,
                  ).paddingAll(6.sp),
                  onPressed: () => Get.back(
                    id: AppRoutes.StoresNavigatorKey,
                  ),
                ),
              ).paddingOnly(left: 15.w),
            ],
          ).paddingOnly(top: 10.h),

          const Spacer(),
          //! About section
          ShopInfoCard(
            info: _uiController.store.about,
          ).paddingOnly(bottom: 10.h)
        ],
      ),
      bottomSheet: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            children: [
              //! Image grid
              Wrap(
                direction: Axis.horizontal,
                spacing: 20.w,
                runSpacing: 15.h,
                clipBehavior: Clip.antiAlias,
                children: List.generate(3, (index) {
                  return SizedBox(
                    height: 100.w,
                    width: 100.w,
                    child: Card(
                      color: fydPGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  );
                }).toList(),
              ).paddingSymmetric(vertical: 10.h),
              //! Social Presence heading
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.h2white(text: 'Social Presence'),
                ],
              ).paddingSymmetric(vertical: 5.h),
              Wrap(
                direction: Axis.horizontal,
                spacing: 40.w,
                runSpacing: 15.h,
                clipBehavior: Clip.antiAlias,
                children: List.generate(MockUi.socialIcons.length, (idx) {
                  return InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/${MockUi.socialIcons[idx]}',
                      height: 30,
                      width: 30,
                    ),
                  );
                }).toList(),
              ).paddingSymmetric(vertical: 25.h),

              //! Address
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.h2white(text: 'Address'),
                ],
              ).paddingSymmetric(vertical: 5.h),
              ShopInfoCard(
                textAlign: CrossAxisAlignment.start,
                info: _uiController.store.storeAddress['default']!,
              ).paddingSymmetric(vertical: 5.h),

              //! Reach Us at
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.h2white(text: 'Reach us on'),
                ],
              ).paddingSymmetric(vertical: 5.h),
              ShopInfoCard(
                textAlign: CrossAxisAlignment.start,
                info:
                    '  Phone: +91  ${_uiController.store.storeContact['default']}',
              ).paddingSymmetric(vertical: 5.h),

              //! Links to Youtube videos
              FydDropdownSection(
                  description: MockUi.storeAddress, heading: 'Featured-In')
            ],
          ),
        ),
      ),
    );
  }
}

class ShopInfoCard extends StatelessWidget {
  final String info;
  final CrossAxisAlignment textAlign;
  const ShopInfoCard({
    Key? key,
    required this.info,
    this.textAlign = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 100.h,
        width: (400 * 0.9).h,
        child: Card(
          color: fydPGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          elevation: 0,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: textAlign,
              children: [
                Text(
                  info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: fydPLgrey,
                      fontFamily: body12.fontFamily,
                      fontSize: body12.fontSize,
                      fontWeight: FontWeight.w600),
                ).paddingSymmetric(horizontal: 8.w, vertical: 20.h),
              ]),
        ));
  }
}
