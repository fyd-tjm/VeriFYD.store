import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/widgets/stores_category_card.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/widgets/store_product_card.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/02%20application/stores/stores_bloc.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../00 core/widgets/00_core_widgets_export.dart';
import '../05 stores/widgets/stores_search_bar.dart';
import 'widgets/banner_card.dart';

//?-----------------------------------------------------------------------------

class HomeViewWrapperPage extends StatelessWidget {
  const HomeViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeViewPage();
  }
}

//?-----------------------------------------------------------------------------

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<SharedInfoCubit, SharedInfoState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/main/home') return true;
            return false;
          },
          listener: (context, state) {
            if (state.failure.isSome()) {
              state.failure.fold(
                  () => null,
                  (failure) => showSnack(
                        context: context,
                        viewType: SnackBarViewType.withNav,
                        durationSeconds: 3,
                        message: failure.when(
                          permissionDenied: () => 'Permission is Denied',
                          notFound: () => 'something went wrong. Restart app!',
                          serverError: () => 'server error. try later',
                          unexpectedError: () =>
                              'something went wrong. Restart app!',
                        ),
                      ));
            }
          },
          buildWhen: (previous, current) {
            if (previous.sharedInfo?.banners != current.sharedInfo?.banners) {
              return true;
            } else if (previous.sharedInfo?.recentlyPurchased !=
                current.sharedInfo?.recentlyPurchased) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            //! Loading
            if (state.sharedInfo == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydBblue,
                  size: 40,
                ),
              );
            }
            //! HomeView
            else {
              return FydView(
                pageViewType: ViewType.with_Nav_Bar,
                isScrollable: false,
                topSheetHeight: 420.h,
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
  final SharedInfoState state;
  const _TopSheet({
    super.key,
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final searchMap = state.sharedInfo!.storeSearchMap;
    final recentMap = state.recentSearchMap;
    return Column(
      children: [
        //! AppBar
        FydAppBar(
          main: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: const Center(
              child: FydRichText(
                size: 26,
                color: fydSblack,
                weight: FontWeight.w700,
                letterSpacing: .85,
                textList: [
                  TextSpan(text: 'veri'),
                  TextSpan(text: 'FYD', style: TextStyle(color: fydPblack)),
                  TextSpan(
                      text: '.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 91, 248),
                          fontSize: 35)),
                  TextSpan(
                    text: 'store',
                  ),
                ],
              ),
            ),
          ),
        ),
        //! store-Search
        Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: StoresSearchBar(
            searchMap: searchMap,
            recentMap: recentMap,
            onResultTap: (searchMapEntry) {
              //-------
              context.read<SharedInfoCubit>().updateRecentSearchMap(
                    recentSearchEntry: searchMapEntry,
                  );
              //-------
              final storesRouter = context.tabsRouter.stackRouterOfIndex(1);
              // storesRouter == null
              if (storesRouter == null) {
                context.navigateTo(StoresRouter(
                  children: [
                    const StoresViewWrapperRoute(),
                    StoreViewWrapperRoute(storeId: searchMapEntry.key)
                  ],
                ));
              }
              // PageCount =1
              else if (storesRouter.pageCount == 1) {
                context.navigateTo(StoresRouter(
                  children: [
                    StoreViewWrapperRoute(storeId: searchMapEntry.key)
                  ],
                ));
              }
              // PageCount =2
              else {
                storesRouter.popForced();
                context.navigateTo(StoresRouter(
                  children: [
                    StoreViewWrapperRoute(storeId: searchMapEntry.key)
                  ],
                ));
              }
            },
          ),
        ),
        //! banner section
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: SizedBox(
            height: 140.h,
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                viewportFraction: 0.85,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
              items: List.generate(
                state.sharedInfo!.banners.length,
                (index) => BannerCard(
                  imageUrl: state.sharedInfo!.banners.keys.elementAt(index),
                  info: state.sharedInfo!.banners.values.elementAt(index),
                ),
              ),
            ),
          ),
        ),
        //! Heading P.category
        Padding(
          padding: EdgeInsets.only(top: 15.h, left: 15.w),
          child: Row(
            children: const [
              FydText.b3custom(
                text: 'Store Categories',
                weight: FontWeight.w700,
                color: fydPgrey,
              )
            ],
          ),
        ),
        //! category Section list
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              //! apparel
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_apparel,
                title: DbHelpers.getSharedInfoField(SharedInfo.apparel),
                color: fydAlblue,
                selectedTitle: null,
                onPressed: (category) {
                  //-------
                  final storesRouter = context.tabsRouter.stackRouterOfIndex(1);
                  // storesRouter == null
                  if (storesRouter == null) {
                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                  }
                  // PageCount =1
                  else if (storesRouter.pageCount == 1) {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                    context.tabsRouter.setActiveIndex(1);
                  }
                  // PageCount =2
                  else {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));

                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                  }
                },
              ),
              //! footwear
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_footwear,
                title: DbHelpers.getSharedInfoField(SharedInfo.footwear),
                color: fydDustyPeach,
                selectedTitle: null,
                onPressed: (category) {
                  //-------
                  final storesRouter = context.tabsRouter.stackRouterOfIndex(1);
                  // storesRouter == null
                  if (storesRouter == null) {
                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                  }
                  // PageCount =1
                  else if (storesRouter.pageCount == 1) {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                    context.tabsRouter.setActiveIndex(1);
                  }
                  // PageCount =2
                  else {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));

                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                  }
                },
              ),
              //! other
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_other,
                title: DbHelpers.getSharedInfoField(SharedInfo.other),
                color: fydAlpink,
                selectedTitle: null,
                onPressed: (category) {
                  //-------
                  final storesRouter = context.tabsRouter.stackRouterOfIndex(1);
                  // storesRouter == null
                  if (storesRouter == null) {
                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                  }
                  // PageCount =1
                  else if (storesRouter.pageCount == 1) {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));
                    context.tabsRouter.setActiveIndex(1);
                  }
                  // PageCount =2
                  else {
                    getIt<StoresBloc>()
                        .add(UpdateSelectedCategory(category: category));

                    context.navigateTo(const StoresRouter(
                      children: [
                        StoresViewWrapperRoute(),
                      ],
                    ));
                  }
                },
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
  final SharedInfoState state;
  const _BottomSheet({
    super.key,
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Heading - R.P.
        Padding(
            padding: EdgeInsets.only(top: 20.h, left: 10.w),
            child: Row(
              children: const [
                FydText.b1custom(
                  text: 'Recently Purchased',
                  color: fydSgrey,
                  weight: FontWeight.w600,
                )
              ],
            )),
        //! Product-H-List-View
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 25.w, right: 50.w),
              children: List.generate(
                state.sharedInfo!.recentlyPurchased.length,
                (index) => StoreProductCard(
                  product: state.sharedInfo!.recentlyPurchased.values
                      .elementAt(index),
                  onProductTap: (p) {
                    //-------
                    final storesRouter =
                        context.tabsRouter.stackRouterOfIndex(1);
                    // storesRouter == null
                    if (storesRouter == null) {
                      context.navigateTo(StoresRouter(
                        children: [
                          const StoresViewWrapperRoute(),
                          StoreViewWrapperRoute(storeId: p.storeId)
                        ],
                      ));
                    }
                    // PageCount =1
                    else if (storesRouter.pageCount == 1) {
                      context.navigateTo(StoresRouter(
                        children: [StoreViewWrapperRoute(storeId: p.storeId)],
                      ));
                    }
                    // PageCount =2
                    else {
                      storesRouter.popForced();
                      context.navigateTo(StoresRouter(
                        children: [StoreViewWrapperRoute(storeId: p.storeId)],
                      ));
                    }
                  },
                  isPriceHidden: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//?-----------------------------------------------------------------------------