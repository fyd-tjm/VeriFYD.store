import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

import '../../02 application/stores/store/store_bloc.dart';
import 'widgets/store_export.dart';

//?-----------------------------------------------------------------------------

class StoreViewWrapperPage extends StatelessWidget {
  const StoreViewWrapperPage({
    Key? key,
    @PathParam() required this.storeId,
  }) : super(key: key);
  final String storeId;

  @override
  Widget build(BuildContext context) {
    // Analytics logging
    getIt<AnalyticsService>().logStoreVisit(storeId: storeId);
    return BlocProvider(
      create: (context) =>
          getIt<StoreBloc>()..add(GetStoreRealtime(storeId: storeId)),
      child: WillPopScope(
        onWillPop: () async {
          final popResult = await showPermissionDialog(
              title: 'Alert!',
              context: context,
              message: " Leaving store? Press Yes to leave, Cancel to stay.",
              falseBtnTitle: 'Cancel',
              trueBtnTitle: 'Yes');
          return popResult ?? false;
        },
        child: StoreViewPage(
          storeId: storeId,
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class StoreViewPage extends StatelessWidget {
  final String storeId;
  const StoreViewPage({Key? key, required this.storeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<StoreBloc, StoreState>(
          listenWhen: (previous, current) {
            if (context.tabsRouter.currentUrl == Rn.stores) {
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
                      permissionDenied: () => '',
                      notFound: () => 'store not found',
                      serverError: () => 'server error: try again',
                      unexpectedError: () => 'unexpected error: try again',
                    ),
                  ),
                  (productFailure) => showSnack(
                    context: context,
                    viewType: SnackBarViewType.withNav,
                    message: productFailure.when(
                      permissionDenied: () => '',
                      notFound: () => 'product not found',
                      serverError: () => 'server error: try again',
                      unexpectedError: () => 'unexpected error: try again',
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
                  color: Colors.transparent,
                  size: 40.0,
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
                    AssetHelper.fetching_error,
                    fit: BoxFit.fitWidth,
                    width: 200,
                  ),
                  const FydText.b2custom(
                    text: 'ahhh! something went wrong',
                    color: fydBbluegrey,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 50.h),
                    child: Column(
                      children: [
                        FydBtn(
                          color: fydSblack,
                          onPressed: () => context
                              .read<StoreBloc>()
                              .add(GetStoreRealtime(storeId: storeId)),
                          height: 50,
                          fydText: const FydText.b1custom(
                            text: 'Reload',
                            color: fydBbluegrey,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        FydBtn(
                          color: fydSblack,
                          onPressed: () => context.router.navigateBack(),
                          height: 50,
                          fydText: const FydText.b1custom(
                            text: 'Go Back',
                            color: fydBbluegrey,
                          ),
                        ),
                      ],
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
                topSheet: _TopSheet(context: context, state: state),
                bottomSheet: _BottomSheet(context: context, state: state),
              );
            }
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final BuildContext context;
  final StoreState state;
  const _TopSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
          leading: AppBarBtn.close(onPressed: () {
            context.router.pop();
          }),
          //! store name
          main: Center(
            child: FydAutoScrollingText(
                width: 300.w,
                height: 50,
                velocity: 10,
                fydText: FydText.h3custom(
                  text: state.storeRealtime!.name,
                  color: fydSblack,
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
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! storeId
              FydRichText(
                weight: FontWeight.bold,
                size: 16,
                color: fydBblue,
                textList: [
                  const TextSpan(text: 'store Id: '),
                  TextSpan(
                    text: state.storeRealtime!.storeId,
                    style: const TextStyle(
                      color: fydPgrey,
                      letterSpacing: .9,
                    ),
                  ),
                ],
              ),
              //! storeInfo
              InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  context.router.push(
                    StoreInfoWrapperRoute(store: state.storeRealtime!),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.store,
                        size: 15.w,
                        color: fydBblue,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      const FydText.b3custom(
                        text: 'Store Info',
                        color: fydPgrey,
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
}
//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final BuildContext context;
  final StoreState state;
  const _BottomSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    //! store-Closed
    if (state.storeRealtime!.isLive == false) {
      return Center(
        child: Image.asset(
          AssetHelper.store_closed,
          width: 250.w,
          fit: BoxFit.fitWidth,
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
            AssetHelper.launch_soon,
            width: 250.w,
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
            child: SizedBox(
              height: 32.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 40.w),
                  itemCount: sortedTypeList.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return List<Widget>.generate(
                      sortedTypeList.length,
                      (int idx) {
                        return StoreTypeChip(
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
                              ? fydSgrey
                              : fydBgreen,
                        );
                      },
                    ).elementAt(index);
                  }),
            ),
          ),
          Builder(builder: (context) {
            //! productList-loading
            if (state.isFetching) {
              return const Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: fydABlueGrey,
                    size: 25.0,
                  ),
                ),
              );
            }
            //! select Product Type
            else if (state.selectedType == null) {
              return const Expanded(
                child: Center(
                  child: FydText.b2custom(
                    text: 'select a Product Type',
                    weight: FontWeight.w600,
                    color: fydBbluegrey,
                  ),
                ),
              );
            }
            //! Type-stockout
            else if (state.productList.isEmpty) {
              return Expanded(
                child: Center(
                  child: Image.asset(
                    AssetHelper.stockout,
                    width: 250.w,
                    fit: BoxFit.fitWidth,
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
                    child: StoreProductGrid(
                      // LoadMore Footer
                      footer: (inStockByType == null)
                          ? 'something went wrong'
                          : (inStockByType > state.productList.length)
                              ? 'load more..'
                              : 'More Products comming Soon!',
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
                                  // Analytics Logging
                                  getIt<AnalyticsService>()
                                      .logProductView(product: product);
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
                                  // Analytics Logging
                                  getIt<AnalyticsService>()
                                      .logProductView(product: product);
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
                                  // Analytics Logging
                                  getIt<AnalyticsService>()
                                      .logProductView(product: product);
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
}
//?-----------------------------------------------------------------------------
