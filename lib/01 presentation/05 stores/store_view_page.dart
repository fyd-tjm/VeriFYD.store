import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_list_view.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/widgets/store_product_card.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../02 application/stores/store/store_bloc.dart';
import '../../presentation/core/widgets/fyd_v_h_listview.dart';
import 'widgets/export_widgets.dart';
import 'widgets/store_offer_card.dart';

//?-----------------------------------------------------------------------------

class StoreViewWrapperPage extends StatelessWidget {
  const StoreViewWrapperPage({
    Key? key,
    @PathParam() required this.storeId,
  }) : super(key: key);
  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<StoreBloc>()..add(GetStoreRealtime(storeId: storeId)),
      child: WillPopScope(
        onWillPop: () async {
          final popResult = await showPermissionDialog(
              context: context,
              message: " Leaving store? Press Yes to leave, Cancel to stay.",
              falseBtnTitle: 'Cancel',
              trueBtnTitle: 'Yes');
          return popResult ?? false;
        },
        child: const StoreViewPage(),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class StoreViewPage extends StatelessWidget {
  const StoreViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // log(context.router.currentUrl);
    // log(context.router.pageCount.toString());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<StoreBloc, StoreState>(
          listenWhen: (previous, current) {
            if (context.tabsRouter.currentUrl == '/main/stores') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.failure.isSome()) {
              state.failure.fold(
                () => null,
                (storeOrProductFailure) => storeOrProductFailure.fold(
                  (storeFailure) => showSnack(
                    context: context,
                    viewType: SnackBarViewType.withNav,
                    message: storeFailure.when(
                      permissionDenied: () => 'permission denied',
                      notFound: () => 'store not found',
                      serverError: () => 'server error, try again',
                      unexpectedError: () => 'unexpected error, try again',
                    ),
                  ),
                  (productFailure) => showSnack(
                    context: context,
                    viewType: SnackBarViewType.withNav,
                    message: productFailure.when(
                      permissionDenied: () => 'permission denied',
                      notFound: () => 'product not found',
                      serverError: () => 'server error, try again',
                      unexpectedError: () => 'unexpected error, try again',
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            //! loading
            if (state.isFetching && state.storeRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydLogoBlue,
                  size: 30.0,
                ),
              );
            }
            //! storeRealtime null
            else if (state.storeRealtime == null) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo/oops.png',
                    fit: BoxFit.fitWidth,
                    width: 250,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 100),
                    child: FydBtn(
                      color: fydPGrey,
                      onPressed: () => context.router.navigateBack(),
                      height: 50,
                      fydText: const FydText.b1custom(
                        text: 'Go Back',
                        color: fydBlueGrey,
                      ),
                    ),
                  )
                ],
              );
            }
            //! storeView
            else {
              return FydView(
                pageViewType: ViewType.with_Nav_Bar,
                isScrollable: false,
                topSheetHeight: 200.h,
                topSheet: _topSheetView(context, state),
                bottomSheet: _bottomSheetView(context, state),
              );
            }
          },
        ),
      ),
    );
  }

//?--TopSheetView---------------------------------------------------------------
  _topSheetView(BuildContext context, StoreState state) {
    //-------
    final messages = <dynamic, String>{
      ...state.storeRealtime!.storeAlerts,
    };
    state.storeRealtime!.coupons.forEach((key, value) {
      if (value.validTill.isAfter(DateTime.now())) {
        final message = '$key :: ${value.message}';
        messages.addAll({messages.length: message});
      }
    });
    //-------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (backBTN + heading)
        FydAppBar(
          //! close-btn
          leading: AppBarBtn(
              iconData: Icons.close_rounded,
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.router.pop();
              }),
          //! store name
          main: Center(
            child: FydAutoScrollingText(
                width: 300.w,
                height: 50.h,
                velocity: 10,
                fydText: FydText.h3custom(
                  text: state.storeRealtime!.name,
                  color: fydPGrey,
                )),
          ),
        ),
        //! Message/offers Section
        SizedBox(
          height: 80.h,
          child: CarouselSlider(
            items: List.generate(
              messages.length,
              (index) => StoreOfferCard(
                message: messages.values.elementAt(index),
                iconData: Icons.auto_awesome_mosaic_outlined,
                onTap: (message) async {
                  await showModal<bool>(
                    context: context,
                    configuration: const FadeScaleTransitionConfiguration(
                      barrierDismissible: true,
                    ),
                    useRootNavigator: false,
                    builder: (context) => FydCloseDialog(
                      message: message,
                      color: fydPGrey.withOpacity(.7),
                      onClose: () => Navigator.of(context).pop(true),
                    ),
                  );
                },
              ),
            ),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: .9,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, reason) {},
            ),
          ),
        ),
        //! [store-Id + store-Info]
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! storeId
              Row(
                children: [
                  const FydText.b3custom(
                    text: "store Id: ",
                    color: fydLogoBlue,
                    weight: FontWeight.bold,
                  ),
                  FydText.b3custom(
                    text: state.storeRealtime!.storeId,
                    color: fydTGrey,
                    weight: FontWeight.bold,
                    letterSpacing: .9,
                  )
                ],
              ),
              //! storeInfo
              InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  context.router.push(
                    StoreInfoViewWrapperRoute(store: state.storeRealtime!),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.store,
                        size: 15.w,
                        color: fydLogoBlue,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const FydText.b3custom(
                        text: 'Store Info',
                        color: fydTGrey,
                        weight: FontWeight.bold,
                        letterSpacing: .9,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

//?--BottomSheetView------------------------------------------------------------
  _bottomSheetView(BuildContext context, StoreState state) {
    //! store-Closed
    if (state.storeRealtime!.isLive == false) {
      return Center(
        child: Image.asset(
          'assets/logo/closed.png',
          fit: BoxFit.contain,
          height: 300.h,
        ),
      );
    }
    //! products-notAdded
    else if (state.storeRealtime!.types.isEmpty ||
        state.storeRealtime!.types.values.every((value) => value == 0)) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.w),
          child: Image.asset(
            'assets/logo/launching-soon.webp',
            width: 300.w,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }
    //! Types and product-grid view
    else {
      //-------
      final sortedTypeList = state.storeRealtime!.types.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value))
        ..map((entry) => entry.key).toList();
      //-------
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! types-listView
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
            child: FydHListView(
              height: 32.h,
              widgetListPadding: EdgeInsets.only(left: 40.w),
              separation: 12.w,
              itemCount: sortedTypeList.length,
              listWidget: List<Widget>.generate(
                sortedTypeList.length,
                (int idx) {
                  return TypeChip(
                    onPressed: (type) {
                      if (type == state.selectedType) return;
                      context
                          .read<StoreBloc>()
                          .add(UpdateSelectedType(type: type));
                    },
                    title: sortedTypeList.elementAt(idx).key,
                    color: (sortedTypeList.elementAt(idx).key !=
                                state.selectedType ||
                            state.selectedType == null)
                        ? fydPLgrey
                        : fydLogoBlue,
                  );
                },
              ),
            ),
          ),
          Builder(builder: (context) {
            //! productList-loading
            if (state.isFetching) {
              return const Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: fydLogoBlue,
                    size: 30.0,
                  ),
                ),
              );
            }
            //! select Product Type
            else if (state.selectedType == null) {
              return const Expanded(
                child: Center(
                  child: FydText.h3custom(
                    text: 'select a Type',
                    weight: FontWeight.w700,
                    color: fydBlueGrey,
                  ),
                ),
              );
            }
            //! Type-stockout
            else if (state.productList.isEmpty) {
              return Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/logo/stockout.png',
                    fit: BoxFit.contain,
                    height: 300.h,
                  ),
                ),
              );
            }
            //! product-List Grid
            else {
              final inStockByType =
                  state.storeRealtime!.types[state.selectedType!];
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Center(
                    child: StoreListView(
                      // LoadMore Footer
                      footer: (inStockByType == null)
                          ? 'something went wrong'
                          : (inStockByType > state.productList.length)
                              ? 'load more..'
                              : 'More Stores Launching Soon!',
                      // LoadMore OnPressed
                      onPressed: (inStockByType != null &&
                              inStockByType > state.productList.length)
                          ? () {
                              context
                                  .read<StoreBloc>()
                                  .add(const LoadMoreProducts());
                            }
                          : () {},
                      // gridView
                      widgetList:
                          List.generate(state.productList.length, (index) {
                        //-----
                        if (index.isEven) {
                          //-----
                          if (index != state.productList.length - 1) {
                            return StoreGridRow(
                              widgetOne: StoreProductCard(
                                product: state.productList.elementAt(index),
                                onProductTap: (product) {
                                  context.router.navigate(ProductWrapperRoute(
                                    productRef: Helpers.getProductRef(
                                        storeId: product.storeId,
                                        skuId: product.skuId),
                                  ));
                                },
                              ),
                              widgetTwo: StoreProductCard(
                                product: state.productList.elementAt(index + 1),
                                onProductTap: (product) {
                                  context.router.navigate(ProductWrapperRoute(
                                    productRef: Helpers.getProductRef(
                                        storeId: product.storeId,
                                        skuId: product.skuId),
                                  ));
                                },
                              ),
                            );
                          }
                          //-----
                          else {
                            return StoreGridRow(
                              widgetOne: StoreProductCard(
                                product: state.productList.elementAt(index),
                                onProductTap: (product) {
                                  context.router.navigate(ProductWrapperRoute(
                                    productRef: Helpers.getProductRef(
                                        storeId: product.storeId,
                                        skuId: product.skuId),
                                  ));
                                },
                              ),
                            );
                          }
                        }
                        //-----
                        else {
                          return const SizedBox.shrink();
                        }
                      }),
                    ),
                  ),
                ),
              );
            }
          }),
        ],
      );
    }
  }
//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------
