import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/application/core/shared_info_controller.dart';
import 'package:verifyd_store/application/stores/stores_ui_controller.dart';
import 'package:verifyd_store/presentation/stores/widgets/stores_verticle_listview.dart';
import 'package:verifyd_store/utils/router/routes.dart';
import '../../core/widgets/fyd_page_view.dart';
import '../../core/widgets/fyd_v_h_listview.dart';
import '../widgets/stores_category_chip.dart';
import '../widgets/stores_tile.dart';

class StoresScreen extends StatelessWidget {
  StoresScreen({Key? key}) : super(key: key);

  final _storesUiController = StoresUiController.i;
  final _sharedInfoController = SharedInfoController.i;

  @override
  Widget build(BuildContext context) {
    return FydPageView(
      isScrollable: false,
      topSheetHeight: 120.h,
      pageViewType: PageViewType.with_Nav_Bar,
      topSheet: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //! Stores heading
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              FydText.d1black(text: 'Stores'),
            ],
          ).paddingOnly(top: 10.h),
          const Spacer(),

          //! Category list
          Obx(() {
            return (_storesUiController.storesByCategory.length.isEqual(0))
                ? const Center(
                    child: LinearProgressIndicator(
                      value: null,
                      backgroundColor: fydPLgrey,
                      color: fydPGrey,
                    ),
                  ).paddingOnly(bottom: 35.h, left: 20.w, right: 20.w)
                : FydHListView(
                    height: 32.h,
                    separation: 12.w,
                    itemCount: _storesUiController.storesByCategory.keys.length,
                    listWidget: List<Widget>.generate(
                      _storesUiController.storesByCategory.keys.length,
                      (int idx) {
                        return StoresCategoryChip(
                          onPressed: () {},
                          title: _storesUiController.storesByCategory.keys
                              .elementAt(idx),
                          controller: _storesUiController,
                          index: idx,
                        );
                      },
                    ).toList(),
                  ).paddingOnly(bottom: 20.h);
          }),
        ],
      ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Stores_verticle_listview widget
          Expanded(
            child: Obx(
              () {
                if (_storesUiController.isFetching.isTrue ||
                    _storesUiController.storesByCategory.isEmpty) {
                  //! loading while fetching stores
                  return const Center(
                    child: CircularProgressIndicator(
                      value: null,
                      backgroundColor: fydPLgrey,
                      color: fydPWhite,
                    ),
                  );
                } else {
                  var selectedCategory =
                      _storesUiController.storesByCategory.keys.elementAt(
                          _storesUiController.selectedCategoryIndex.value);
                  var storesList = _storesUiController.storesByCategory.entries
                      .elementAt(
                          _storesUiController.selectedCategoryIndex.value)
                      .value;
                  if (storesList.isEmpty) {
                    //! if no stores available at the moment
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
                    var areMoreStoresAvailable = _sharedInfoController
                            .sharedInfo.value!.liveStores[selectedCategory]! >
                        storesList.length;
                    //! if available
                    return StoresVerticleListview(
                      categoryHeader: selectedCategory,
                      widgetList: List.generate(storesList.length, (index) {
                        return StoresTile(
                          store: storesList.elementAt(index),
                          //TODO: add navigation to store page
                          onPressedCallback: (store) => Get.toNamed(
                              AppRoutes.getStoreRoute,
                              arguments: store,
                              id: AppRoutes.StoresNavigatorKey),
                        ).paddingSymmetric(horizontal: 15.w);
                      }),
                      footer: (areMoreStoresAvailable)
                          ? 'Load More ...'
                          : 'More Stores Launching Soon!',
                      onPressed: () {
                        (areMoreStoresAvailable)
                            ? _storesUiController
                                .fetchStores(storesList.last.sId)
                            : () {};
                      },
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
