import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_view_page.dart';
import 'package:verifyd_store/02%20application/stores/stores_bloc.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';
import '../../00 ui-core/ui_exports.dart';
import '../../presentation/core/widgets/fyd_v_h_listview.dart';
import 'widgets/export_widgets.dart';

//?-----------------------------------------------------------------------------
class StoresViewWrapperPage extends StatelessWidget {
  const StoresViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<StoresBloc>(),
        ),
        BlocProvider.value(
          value: getIt<SharedInfoCubit>(),
        ),
      ],
      child: const StoresViewPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class StoresViewPage extends StatelessWidget {
  const StoresViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<StoresBloc, StoresState>(
          listenWhen: (previous, current) {
            //TODO: Listen when routing condition
            return true;
          },
          listener: (context, state) {
            if (state.failure.isSome()) {
              state.failure.fold(
                  () => null,
                  (storeFailure) => showSnack(
                        context: context,
                        durationSeconds: 2,
                        message: storeFailure.when(
                          permissionDenied: () => 'permission Denied',
                          notFound: () => 'not exist anymore',
                          serverError: () => 'server Error',
                          unexpectedError: () => 'something went wrong',
                        ),
                      ));
            }
          },
          buildWhen: (previous, current) {
            //TODO: navigation/buildWhen condition
            return true;
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.with_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 200.h,
              topSheet: _topSheetView(context, state),
              bottomSheet: _bottomSheetView(context, state),
            );
          },
        ),
      ),
    );
  }

//?--TopSheetView---------------------------------------------------------------
  Widget _topSheetView(BuildContext context, StoresState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TODO: search bar
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
                width: 380.w,
                child: Card(
                  color: fydPDgrey,
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //! icon
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Icon(
                          Icons.manage_search_sharp,
                          size: 32.sp,
                          color: fydPWhite,
                        ),
                      ),

                      //! hint Text
                      Expanded(
                          child: FydText.b3white(
                        text: 'Find Store via name (or) #id',
                        weight: FontWeight.w600,
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //! category  H-listView
        Builder(
          builder: (context) {
            final categoryList = context.select(
                (SharedInfoCubit cubit) => cubit.state.sharedInfo?.categories);
            if (categoryList == null) {
              return Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: const Center(
                  child: SpinKitThreeBounce(
                    color: fydPDgrey,
                    size: 30.0,
                  ),
                ),
              );
            } //-------
            else {
              // sorting category
              final sortedCategoryMap = Helpers.sortMapByKeys(categoryList);
              //---------
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: FydHListView(
                  height: 95.h,
                  widgetListPadding: EdgeInsets.only(left: 30.h),
                  separation: 40.w,
                  itemCount: sortedCategoryMap.length,
                  listWidget: List.generate(
                    sortedCategoryMap.length,
                    (idx) => FydCategoryCard(
                      svgAsset: sortedCategoryMap.values.elementAt(idx),
                      title: sortedCategoryMap.keys.elementAt(idx),
                      color: Helpers.getColorForIndex(idx),
                      onPressed: (category) {
                        context
                            .read<StoresBloc>()
                            .add(UpdateSelectedCategory(category: category));
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

//?--BottomSheetView------------------------------------------------------------
  Widget _bottomSheetView(BuildContext context, StoresState state) {
    //! Loading
    if (state.isFetching) {
      return const Center(
        child: SpinKitWave(
          color: fydPWhite,
          size: 40.0,
        ),
      );
    }
    //! No Selected Category
    else if (state.selectedCategory == null) {
      return Center(
        child: FydText.h1custom(
          text: 'select a category',
          weight: FontWeight.w700,
          color: fydDustyPeach,
        ),
      );
    }
    //! stores-card V-listView
    else {
      // footer logic
      final liveStores = (context.select((SharedInfoCubit cubit) =>
          cubit.state.sharedInfo?.liveStores[state.selectedCategory]));
      //--------
      return Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: StoresVerticleListview(
          onEmptyListWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 80.w),
            //TODO: SharedInfo-Image-Caching/Alternate
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/5578/5578691.png'),
          ),
          categoryHeader: Helpers.toPascalCase(state.selectedCategory)!,
          widgetList: List.generate(
            state.storeList.length,
            (index) => StoresTile(
                store: state.storeList.elementAt(index),
                onPressedCallback: (store) {
                  // Store onClick navigation
                  context.router
                      .push(StoreViewWrapperRoute(storeId: store.storeId));
                }),
          ),
          footer: (liveStores == null)
              ? 'something went wrong'
              : (liveStores > state.storeList.length)
                  ? 'load more..'
                  : 'More Stores Launching Soon!',
          // LoadMore OnPressed
          onPressed: (liveStores != null && liveStores > state.storeList.length)
              ? () {
                  context.read<StoresBloc>().add(const LoadMoreStores());
                }
              : () {},
        ),
      );
    }
  }

//?-----------------------------------------------------------------------------
}
