import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_list_view.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_name_header.dart';
import 'package:verifyd_store/presentation/stores/sub%20views/store/widgets/store_product_card.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import '../../02 application/stores/store/store_bloc.dart';
import '../../03 domain/store/store.dart';
import '../../presentation/core/widgets/fyd_v_h_listview.dart';
import 'widgets/export_widgets.dart';

class StoreViewWrapperPage extends StatelessWidget {
  const StoreViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<StoreBloc>()..add(GetStoreRealtime(storeId: MockUi.store.sId)),
      child: StoreViewPage(
        store: MockUi.store,
        color: fydSPink,
      ),
    );
  }
}

class StoreViewPage extends StatelessWidget {
//?-----------------------------------------------------------------------------
  const StoreViewPage({Key? key, required this.store, required this.color})
      : super(key: key);
  final Store? store;
  final Color color;
  //addcolor
//?-----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreBloc, StoreState>(
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
      child: FydView(
        pageViewType: ViewType.with_Nav_Bar,
        isScrollable: false,
        topSheetColor: color,
        topSheetHeight: 200.h,
        topSheet: _topSheetView(context),
        bottomSheet: _bottomSheetView(context),
      ),
    );
  }

//?--TopSheetView---------------------------------------------------------------
  _topSheetView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // AppBar
        FydAppBar(
          leading: Center(
            child: IconButton(
              //TODO: navigation
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30.w,
                color: Helpers.getContrastColor(color),
              ),
            ),
          ),
          main: Center(
            child: StoreNameHeader(
                storeName: store?.name ?? 'Store Name was null'),
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
              FydText.b3black(text: store?.rating.toString() ?? '--'),
            ],
          ),
        ),
        // [store-Info]
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: InkWell(
            //TODO: navigation
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.store_rounded,
                  size: 30.w,
                  color: Helpers.getContrastColor(color),
                ),
                SizedBox(
                  width: 8.w,
                ),
                FydText.b1grey(text: 'Store Info'),
              ],
            ),
          ),
        ),

        //todo: Message Section/offers Section
      ],
    );
  }

//?--BottomSheetView------------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    return Builder(builder: (context) {
      final isStoreLive =
          context.select((StoreBloc bloc) => bloc.state.storeRealtime?.isLive);
      if (isStoreLive != null && isStoreLive == false) {
        //store is closed/not taking order at the moment
        return Center(
          child: FydText.h1custom(
            text: 'Store is closed at the moment.',
            weight: FontWeight.w700,
            color: fydDustyPeach,
          ),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
//?--Type-chip-list-view--------------------------------------------------------
            Builder(builder: (context) {
              //--------------------------------------------------------------------
              final typeMap = context
                  .select((StoreBloc bloc) => bloc.state.storeRealtime?.types);
              final selectedType =
                  context.select((StoreBloc bloc) => bloc.state.selectedType);
              //--------------------------------------------------------------------
              if (typeMap == null) {
                //------------------------------------------------------------------
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: color,
                      size: 30.0,
                    ),
                  ),
                );
                //------------------------------------------------------------------
              } else {
                //------------------------------------------------------------------
                // sorting typelist
                final sortedTypeList =
                    Helpers.sortMapByValues(typeMap).keys.toList().reversed;
                return Padding(
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
                            if (type == selectedType) return;
                            context
                                .read<StoreBloc>()
                                .add(UpdateSelectedType(type: type));
                          },
                          title: sortedTypeList.elementAt(idx),
                          color:
                              (sortedTypeList.elementAt(idx) != selectedType ||
                                      selectedType == null)
                                  ? fydPLgrey
                                  : color,
                        );
                      },
                    ),
                  ),
                );
                //------------------------------------------------------------------
              }
            }),

//?--product-grid-view----------------------------------------------------------
            BlocBuilder<StoreBloc, StoreState>(
              builder: (context, state) {
                //------------------------------------------------------------------
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
                //------------------------------------------------------------------
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
                //------------------------------------------------------------------
                else {
                  final productList = state.productList;
                  //----------------------------------------------------------------
                  if (productList.isEmpty) {
                    return Expanded(
                        child: Center(
                      child: FydText.h2custom(
                          text: 'Out of Stock', color: fydDustyPeach),
                    ));
                  }
                  //------------------------------------------------------------------
                  else {
                    //? footer logic
                    final inStockByType =
                        state.storeRealtime?.types[state.selectedType];
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
                              List.generate(productList.length, (index) {
                            //-----
                            if (index.isEven) {
                              //-----
                              if (index != productList.length - 1) {
                                return StoreGridRow(
                                  widgetOne: StoreProductCard(
                                    product: productList.elementAt(index),
                                    onProductTap: (v) {},
                                  ),
                                  widgetTwo: StoreProductCard(
                                    product: productList.elementAt(index + 1),
                                    onProductTap: (p) {},
                                  ),
                                );
                              }
                              //-----
                              else {
                                return StoreGridRow(
                                  widgetOne: StoreProductCard(
                                    product: productList.elementAt(index),
                                    onProductTap: (p) {},
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
                  //----------------------------------------------------------------
                }
                //------------------------------------------------------------------
              },
            ),
          ],
        );
      }
    });
  }
//?-----------------------------------------------------------------------------
}
