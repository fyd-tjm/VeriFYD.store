import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_Icon_btn.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
import '../../../../utils/router/routes.dart';
import '../../widgets/address_selection_card.dart';

class DeliveryInfoScreen extends StatelessWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydPageView(
        pageViewType: PageViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 120.h,
        topSheet: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                //! DeliveryInfo Heading
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FydText.d2black(text: 'Delivery Info'),
                      ]),
                ),
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
                    onPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
                  ),
                ).paddingOnly(left: 15.w),
              ],
            ).paddingOnly(top: 10.h),
            //! delivery addresses sub heading
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FydText.b2grey(
                  text: 'Delivery Address',
                  weight: FontWeight.w600,
                ).paddingOnly(left: 40.w, bottom: 10.h)
              ],
            )
          ],
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  //! selectable address card
                  AddressSelectionCard(address: MockUi.deliveryAddress)
                      .paddingOnly(top: 15.h),
                  Divider(
                    height: 30.h,
                    color: fydPWhite,
                  ),
                  //! new address btn
                  FydIconBtn(
                    fydText: FydText.h3white(text: 'Add New Address'),
                    onPressed: () => Get.toNamed(AppRoutes.getNewAddressRoute,
                        id: AppRoutes.MainNavigatorKey),
                    color: fydPGrey,
                    height: 70.h,
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
              //! proceed btn
              FydBtn(
                height: 60.h,
                color: fydPGrey,
                fydText: FydText.h2white(text: 'Proceed'),
                onPressed: () => Get.offAndToNamed(AppRoutes.getPaymentRoute,
                    id: AppRoutes.MainNavigatorKey),
              ),
            ],
          ),
        ));
  }
}
