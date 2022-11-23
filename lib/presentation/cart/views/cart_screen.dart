import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_v_h_listview.dart';
import 'package:verifyd_store/utils/router/routes.dart';
import '../../core/widgets/fyd_page_view.dart';
import '../widgets/cart_product_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  //! Screenheights(835) { navBar(80) + topandbottomSheet(750) }
  @override
  Widget build(BuildContext context) {
    return FydPageView(
        isScrollable: false,
        topSheetHeight: 420.h,
        pageViewType: PageViewType.with_Nav_Bar,
        topSheet: Column(
          children: [
            //! Cart-Heading and Delete-Icon
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FydText.d2black(text: 'Cart'),
                      ]),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(8.sp),
                        primary: fydPDgrey),
                    child: Icon(
                      Icons.delete_forever,
                      size: 30.sp,
                    ),
                    onPressed: () {},
                  ),
                ).paddingOnly(right: 15.w),
              ],
            ).paddingOnly(top: 10.h),
            //! Cart-list
            Expanded(
              child: FydVListView(
                width: double.infinity,
                separation: 0.h,
                itemCount: MockUi.cartList.length,
                listWidget: List.generate(
                  MockUi.cartList.length,
                  ((idx) {
                    return CartProductTile(
                        prodName: MockUi.cartList[idx].elementAt(0),
                        color: MockUi.cartList[idx].elementAt(1),
                        size: MockUi.cartList[idx].elementAt(2),
                        price: MockUi.cartList[idx].elementAt(3),
                        qty: MockUi.cartList[idx].elementAt(4));
                  }),
                ).toList(),
              ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
            ),
          ],
        ),
        bottomSheet: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! Discount-code
              SizedBox(
                height: 60.h,
                child: Card(
                  color: fydPWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      FydText.h2grey(text: 'Discount code'),
                      const Spacer(),
                      FydBtn(
                        fydText: FydText.b2white(text: 'Apply'),
                        onPressed: () {},
                        width: 80.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ),
                ),
              ).paddingOnly(bottom: 10.h),
              //! Billing-Section
              Column(
                children: [
                  //!subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FydText.b1white(text: 'Sub-Total'),
                      FydText.b1white(
                        text: '+ \$ 12.54',
                        weight: FontWeight.w600,
                      )
                    ],
                  ).paddingOnly(top: 10.h),
                  //!shipping
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FydText.b1white(text: 'Shipping'),
                      FydText.b1white(
                        text: '+ \$ 12.54',
                        weight: FontWeight.w600,
                      )
                    ],
                  ).paddingOnly(top: 5.h),
                  //!Discount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FydText.b1white(text: 'Discount'),
                      FydText.b1white(
                        text: '- \$ 12.54',
                        weight: FontWeight.w600,
                      )
                    ],
                  ).paddingOnly(top: 5.h),
                  Divider(
                    height: 20.h,
                    color: fydPWhite,
                  ),
                  //!total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FydText.b1white(text: 'Total'),
                      FydText.b1white(
                        text: '\$ 12.54',
                        weight: FontWeight.w600,
                      )
                    ],
                  ).paddingOnly(top: 5.h),
                ],
              ).paddingSymmetric(horizontal: 20.w),
              SizedBox(
                height: 25.h,
              ),
              //! checkout-btn
              FydBtn(
                height: 60.h,
                color: fydPGrey,
                fydText: FydText.h2white(text: 'Checkout'),
                onPressed: () => Get.toNamed(AppRoutes.getDeliveryInfoRoute,
                    id: AppRoutes.MainNavigatorKey),
              )
            ],
          ).paddingOnly(bottom: 10.h, top: 20.h, left: 15.w, right: 15.w),
        ));
  }
}
