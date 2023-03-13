import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/04%20home/widgets/store_search.dart';
import 'package:verifyd_store/02%20application/stores/stores_bloc.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.gr.dart';
import '../../00 ui-core/ui_exports.dart';
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
    log(context.router.currentUrl);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<StoresBloc, StoresState>(
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
        Builder(builder: (context) {
          final searchMap = context.select((SharedInfoCubit cubit) =>
              cubit.state.sharedInfo!.storeSearchMap);
          final recentMap = context
              .select((SharedInfoCubit cubit) => cubit.state.recentSearchMap);
          //! search bar
          return Padding(
            padding: EdgeInsets.only(top: 20.h, left: 8.w, right: 8.w),
            child: StoreSearchBar(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                await showCustomSearch(
                  context: context,
                  delegate: StoreSearch(
                    context: context,
                    searchMap: searchMap,
                    recentMap: recentMap,
                    onTap: (searchMapEntry) {
                      context.read<SharedInfoCubit>().updateRecentSearchMap(
                            recentSearchEntry: searchMapEntry,
                          );
                      context.navigateTo(
                          StoreViewWrapperRoute(storeId: searchMapEntry.key));
                    },
                  ),
                );
              },
            ),
          );
        }),

        //! categories
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              //! apparel
              FydCategoryCard(
                svgAsset: 'assets/icons/apparels.svg',
                title: DbHelpers.getSharedInfoField(SharedInfo.apparel),
                color: fydSBlue,
                selectedTitle: state.selectedCategory,
                onPressed: (category) {
                  context
                      .read<StoresBloc>()
                      .add(UpdateSelectedCategory(category: category));
                },
              ),
              //! footwear
              FydCategoryCard(
                svgAsset: 'assets/icons/footwear.svg',
                title: DbHelpers.getSharedInfoField(SharedInfo.footwear),
                color: fydDustyPeach,
                selectedTitle: state.selectedCategory,
                onPressed: (category) {
                  context
                      .read<StoresBloc>()
                      .add(UpdateSelectedCategory(category: category));
                },
              ),
              //! other
              FydCategoryCard(
                svgAsset: 'assets/icons/others.svg',
                title: DbHelpers.getSharedInfoField(SharedInfo.other),
                color: fydSPink,
                selectedTitle: state.selectedCategory,
                onPressed: (category) {
                  context
                      .read<StoresBloc>()
                      .add(UpdateSelectedCategory(category: category));
                },
              ),
            ],
          ),
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
          color: fydLogoBlue,
          size: 40.0,
        ),
      );
    }
    //! No Selected Category
    else if (state.selectedCategory == null) {
      return const Center(
        child: FydText.h3custom(
          text: 'select a category',
          weight: FontWeight.w700,
          color: fydBlueGrey,
        ),
      );
    }
    //! stores-card V-listView
    else {
      // footer logic
      final liveStores = (context.select((SharedInfoCubit cubit) =>
          cubit.state.sharedInfo?.liveStores[state.selectedCategory]));
      // launching soon image url
      //--------
      return Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: StoresVerticleListview(
          onEmptyListWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.w),
            child: Image.asset(
              'assets/logo/launching-soon.webp',
              width: 300.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          categoryHeader: Helpers.toPascalCase(state.selectedCategory)!,
          widgetList: List.generate(
            state.storeList.length,
            (index) => StoresTile(
                store: state.storeList.elementAt(index),
                onPressedCallback: (store) {
                  context.navigateTo(
                      StoreViewWrapperRoute(storeId: store.storeId));
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

class StoreSearchBar extends StatelessWidget {
  const StoreSearchBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      height: 55.h,
      width: double.infinity,
      color: fydPDgrey,
      onPressed: onPressed,
      widget: Row(
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
              color: fydLogoBlue,
            ),
          ),
          //! hint Text
          const Expanded(
            child: FydRichText(
              size: 15,
              color: fydBlueGrey,
              weight: FontWeight.w600,
              letterSpacing: .9,
              textList: [
                TextSpan(
                  text: 'find store via ',
                ),
                TextSpan(
                    text: '#',
                    style: TextStyle(
                        color: fydPWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                    text: 'store-id',
                    style: TextStyle(color: fydBlueGrey, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
