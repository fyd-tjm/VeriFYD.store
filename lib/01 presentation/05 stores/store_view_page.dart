import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_list_view.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_name_header.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/widgets/store_product_card.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../02 application/stores/store/store_bloc.dart';
import '../../presentation/core/widgets/fyd_v_h_listview.dart';
import 'widgets/export_widgets.dart';

//?-----------------------------------------------------------------------------

class StoreViewWrapperPage extends StatelessWidget {
  const StoreViewWrapperPage({
    Key? key,
    @PathParam() required this.storeId,
  }) : super(key: key);
  final String storeId;

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    log(storeId);
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
        child: StoreViewPage(
          color: Helpers.getRandomColor(),
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class StoreViewPage extends StatelessWidget {
  const StoreViewPage({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<StoreBloc, StoreState>(
          listenWhen: (previous, current) {
            //TODO: router logic
            return true;
          },
          listener: (context, state) {
            if (state.failure.isSome()) {
              state.failure.fold(
                () => null,
                (storeOrProductFailure) => storeOrProductFailure.fold(
                  (storeFailure) => showSnack(
                    context: context,
                    message: storeFailure.when(
                      permissionDenied: () => 'permission denied',
                      notFound: () => 'store not found',
                      serverError: () => 'server error, try again',
                      unexpectedError: () => 'unexpected error, try again',
                    ),
                  ),
                  (productFailure) => showSnack(
                    context: context,
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
          buildWhen: (previous, current) {
            //TODO: router/buildWhen logic
            return true;
          },
          builder: (context, state) {
            //! loading
            if (state.isFetching && state.storeRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydBlueGrey,
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
                  FydText.h3custom(
                    text: 'store not available at the moment',
                    weight: FontWeight.w700,
                    color: fydBlueGrey,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 100),
                    child: FydBtn(
                      onPressed: () => context.router.navigateBack(),
                      height: 50,
                      fydText:
                          FydText.b1custom(text: 'Go Back', color: fydBlueGrey),
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
                topSheetColor: color,
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
    final messages = <dynamic, String>{};
    state.storeRealtime!.storeAlerts.forEach((key, value) {
      final entry = {key: value};
      messages.addAll(entry);
    });
    state.storeRealtime!.offers.forEach((key, value) {
      final entry = {key: value};
      messages.addAll(entry);
    });
    //-------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (backBTN + heading)
        FydAppBar(
          leading: Center(
            child: IconButton(
              //!: back navigation
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30.w,
                color: Helpers.getContrastColor(color),
              ),
            ),
          ),
          main: Center(
            child: StoreNameHeader(storeName: state.storeRealtime!.name),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_outlined,
                size: 20.w,
              ),
            ],
          ),
        ),
        //! Message/offers Section
        SizedBox(
          height: 80.h,
          child: CarouselSlider(
            items: List.generate(
              messages.length,
              (index) => FydTextCard(
                message: messages.values.elementAt(index),
                textColor: Helpers.getContrastColor(color),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                  FydText.b3custom(
                    text: "store Id: ",
                    color: Helpers.getContrastColor(color),
                    weight: FontWeight.bold,
                  ),
                  FydText.b2custom(
                    text: state.storeRealtime!.storeId,
                    color: fydBlueGrey,
                    weight: FontWeight.bold,
                  )
                ],
              ),
              //! storeInfo
              InkWell(
                onTap: () {
                  context.router.push(
                    StoreInfoViewWrapperRoute(
                        store: state.storeRealtime!, color: color),
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
                        color: Helpers.getContrastColor(color),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      FydText.b2custom(
                        text: 'Store Info',
                        color: fydBlueGrey,
                        weight: FontWeight.bold,
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
        child: FydText.h1custom(
          text: 'Store is closed at the moment.',
          weight: FontWeight.w700,
          color: fydDustyPeach,
        ),
      );
    }
    //! products-notAdded
    else if (state.storeRealtime!.types.isEmpty) {
      return Center(
        child: FydText.h1custom(
          text: 'No products live at the moment.',
          weight: FontWeight.w700,
          color: fydDustyPeach,
        ),
      );
    }
    //! Types and products view
    else {
      //-------
      final sortedTypeList = Helpers.sortMapByValues(state.storeRealtime!.types)
          .keys
          .toList()
          .reversed;
      //-------
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! types-listView
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
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
                    title: sortedTypeList.elementAt(idx),
                    color:
                        (sortedTypeList.elementAt(idx) != state.selectedType ||
                                state.selectedType == null)
                            ? fydPLgrey
                            : color,
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
                    color: fydPWhite,
                    size: 40.0,
                  ),
                ),
              );
            }
            //! select Product Type
            else if (state.selectedType == null) {
              return Expanded(
                child: Center(
                  child: FydText.h1custom(
                    text: 'select a Type',
                    weight: FontWeight.w700,
                    color: fydDustyPeach,
                  ),
                ),
              );
            }
            //! product-List Empty
            else if (state.productList.isEmpty) {
              return Expanded(
                child: Center(
                  child: FydText.h2custom(
                      text: 'Out of Stock', color: fydBlueGrey),
                ),
              );
            }
            //! product-List Grid
            else {
              final inStockByType =
                  state.storeRealtime!.types[state.selectedType!];
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
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
