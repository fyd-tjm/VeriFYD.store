import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_heading_with_back_btn.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_v_h_listview.dart';
import 'package:verifyd_store/presentation/profile/sub%20views/orders/widgets/orders_card.dart';
import 'package:verifyd_store/presentation/profile/sub%20views/orders/widgets/orders_group_btn.dart';

import '../../../../../utils/router/routes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GroupButtonController controller = GroupButtonController();
    controller.selectIndex(0);
    return FydPageView(
        pageViewType: PageViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 180.h,
        topSheet: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //! heading with btn
            FydHeadingWithBackBtn(
              heading: 'Orders',
              onBackPressed: () => Get.back(id: AppRoutes.MainNavigatorKey),
            ),
            //! Current and History btn
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            OrdersGroupBtn(
              controller: controller,
              hvPadding: EdgeInsets.symmetric(horizontal: 10.w),
              btnNameList: const ['Current', 'History'],
              onSelected: (p0, p1, p2) => log(p1.toString()),
            ).paddingOnly(bottom: 20.h),
          ],
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            //! OrdersCard list view
            children: [
              Expanded(
                child: FydVListView(
                  width: double.infinity,
                  separation: 20.h,
                  itemCount: 2,
                  listWidget: List.generate(2, (idx) {
                    return GestureDetector(
                        onTap: () => Get.toNamed(
                              AppRoutes.getOrderRoute,
                              id: AppRoutes.MainNavigatorKey,
                            ),
                        child: OrdersCard(orderInfo: MockUi.orderInfo));
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
