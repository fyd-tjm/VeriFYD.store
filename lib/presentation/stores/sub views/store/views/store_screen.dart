import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/application/core/shared_info_controller.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_misc_widgets.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_page_view.dart';
import 'package:verifyd_store/application/stores/store_ui_controller.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_name_header.dart';
import 'package:verifyd_store/utils/helpers/logger.dart';

import '../../../../../utils/router/routes.dart';
import '../../../../core/widgets/fyd_v_h_listview.dart';
import '../widgets/store_list_view.dart';
import '../widgets/store_product_card.dart';
import '../widgets/store_type_chip.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);
//?-----------------------------------------------------------------------------
  final logger = getLogger('StoreScreen');
  final _uiController = StoreUiController.i;
  final _sharedInfoController = SharedInfoController.i;
//?-----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return FydPageView(
        pageViewType: PageViewType.with_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 120.h,
//?-----------------------------------------------------------------------------
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
                        (_uiController.store.sId == null)
                            ? const CircularProgressIndicator()
                            : StoreNameHeader(
                                storeName: _uiController.store.name),
                      ]),
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
                      FydText.b3black(text: '4.6'),
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
                    onPressed: () {
                      Get.back(id: AppRoutes.StoresNavigatorKey);
                    },
                  ),
                ).paddingOnly(left: 15.w),
              ],
            ).paddingOnly(top: 10.h),

            const Spacer(),
            //! StoreInfo btn
            InkWell(
              onTap: () => Get.toNamed(
                AppRoutes.getStoreInfoRoute,
                id: AppRoutes.StoresNavigatorKey,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 30.sp,
                    color: fydNotifGreen,
                  ),
                  FydText.b2grey(text: 'Shop Info').paddingOnly(left: 5.w),
                ],
              ).paddingOnly(bottom: 20.h),
            )
          ],
        ),
//?-----------------------------------------------------------------------------
        bottomSheet: Column(
          children: [
            //! product types chip list
            GetX<StoreUiController>(builder: (uiController) {
              if (uiController.storeRealtime.value == null) {
                return const FydLinearIndicator()
                    .paddingOnly(left: 20.w, right: 20.w);
              } else {
                if (uiController.storeRealtime.value!.isLive == false) {
                  return const SizedBox.shrink();
                } else {
                  if (uiController.productByType.isEmpty) {
                    return const FydLinearIndicator()
                        .paddingOnly(left: 20.w, right: 20.w);
                  } else {
                    return FydHListView(
                      height: 32.h,
                      separation: 12.w,
                      itemCount: uiController.productByType.keys.length,
                      listWidget: List<Widget>.generate(
                        uiController.productByType.keys.length,
                        (int idx) {
                          return StoreTypeChip(
                            onPressed: () {},
                            title:
                                uiController.productByType.keys.elementAt(idx),
                            controller: uiController,
                            index: idx,
                          );
                        },
                      ).toList(),
                    ).paddingOnly(top: 30.h, bottom: 20.h);
                  }
                }
              }
            }),
            //! product card grid view
            Expanded(
              child: GetX<StoreUiController>(builder: (uiController) {
                if (uiController.isFetching.isTrue ||
                    uiController.productByType.isEmpty) {
                  //! loading while fetching products
                  return const FydCircularIndicator();
                } else {
                  if (uiController.storeRealtime.value!.isLive == false) {
                    return Padding(
                      padding: EdgeInsets.only(top: 80.h),
                      child:
                          Center(child: Image.asset('assets/logo/closed.png')),
                    );
                  } else {
                    var selectedType = uiController.productByType.keys
                        .elementAt(uiController.selectedTypeIndex.value);
                    var productsList = uiController.productByType.entries
                        .elementAt(uiController.selectedTypeIndex.value)
                        .value;

                    if (productsList.isEmpty) {
                      //! if no products available at the moment
                      return SizedBox(
                        width: 200.w,
                        child: Card(
                          color: fydPDgrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.network(
                            _sharedInfoController
                                .sharedInfo.value!.images['comingSoon']!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 0.w);
                    } else {
                      var areMoreProductAvailable = (uiController
                              .storeRealtime.value!.types[selectedType]! >
                          productsList.length);
                      return StoreListView(
                        footer: (areMoreProductAvailable)
                            ? 'Load More ...'
                            : 'More Products coming Soon!',
                        onPressed: () {
                          (areMoreProductAvailable)
                              ? uiController
                                  .fetchProducts(productsList.last.skuId)
                              : () {};
                        },
                        widgetList: List.generate(productsList.length, (index) {
                          if (index.isEven) {
                            if (index != productsList.length - 1) {
                              return StoreGridRow(
                                widgetOne: StoreProductCard(
                                  product: productsList.elementAt(index),
                                  onProductTap: (product) => Get.toNamed(
                                      AppRoutes.getProductRoute,
                                      arguments: product,
                                      id: AppRoutes.StoresNavigatorKey),
                                ),
                                widgetTwo: StoreProductCard(
                                  product: productsList.elementAt(index + 1),
                                  onProductTap: (product) => Get.toNamed(
                                      AppRoutes.getProductRoute,
                                      arguments: product,
                                      id: AppRoutes.StoresNavigatorKey),
                                ),
                              );
                            } else {
                              return StoreGridRow(
                                widgetOne: StoreProductCard(
                                  product: productsList.elementAt(index),
                                  onProductTap: (product) => Get.toNamed(
                                      AppRoutes.getProductRoute,
                                      arguments: product,
                                      id: AppRoutes.StoresNavigatorKey),
                                ),
                              );
                            }
                          } else {
                            return const SizedBox.shrink();
                          }
                        }).toList(),
                      ).paddingSymmetric(horizontal: 20.w);
                    }
                  }
                }
              }),
            ),
          ],
        ));
  }
}
