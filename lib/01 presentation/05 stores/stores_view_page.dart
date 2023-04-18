import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/02%20application/stores/stores_bloc.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';

import 'widgets/stores_export.dart';

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<StoresBloc, StoresState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == Rn.stores) return true;
            return false;
          },
          listener: (context, state) {
            if (state.failure.isSome()) {
              state.failure.fold(
                  () => null,
                  (storeFailure) => showSnack(
                        context: context,
                        durationSeconds: 2,
                        viewType: SnackBarViewType.withNav,
                        message: storeFailure.when(
                          permissionDenied: () => 'permission Denied',
                          notFound: () => 'not exist anymore',
                          serverError: () => 'server Error: try again',
                          unexpectedError: () =>
                              'something went wrong: try again',
                        ),
                      ));
            }
          },
          buildWhen: (previous, current) {
            if (context.router.currentUrl == Rn.stores) return true;
            return false;
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.with_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 200.h,
              topSheet: _TopSheet(context: context, state: state),
              bottomSheet: _BottomSheet(context: context, state: state),
            );
          },
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final BuildContext context;
  final StoresState state;
  const _TopSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
            child: StoresSearchBar(
              searchMap: searchMap,
              recentMap: recentMap,
              onResultTap: (searchMapEntry) {
                context.read<SharedInfoCubit>().updateRecentSearchMap(
                      recentSearchEntry: searchMapEntry,
                    );
                context.navigateTo(
                    StoreViewWrapperRoute(storeId: searchMapEntry.key));
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
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_apparel,
                title: DbHelpers.getSharedInfoField(SharedInfoFields.apparel),
                color: fydAlblue,
                selectedTitle: state.selectedCategory,
                onPressed: (category) {
                  context
                      .read<StoresBloc>()
                      .add(UpdateSelectedCategory(category: category));
                },
              ),
              //! footwear
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_footwear,
                title: DbHelpers.getSharedInfoField(SharedInfoFields.footwear),
                color: fydDustyPeach,
                selectedTitle: state.selectedCategory,
                onPressed: (category) {
                  context
                      .read<StoresBloc>()
                      .add(UpdateSelectedCategory(category: category));
                },
              ),
              //! other
              StoresCategoryCard(
                svgAsset: AssetHelper.svg_other,
                title: DbHelpers.getSharedInfoField(SharedInfoFields.other),
                color: fydAlpink,
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
}

//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final BuildContext context;
  final StoresState state;
  const _BottomSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    //! Loading
    if (state.isFetching) {
      return const Center(
        child: SpinKitWave(
          color: fydBblue,
          size: 40.0,
        ),
      );
    }
    //! No Selected Category
    else if (state.selectedCategory == null) {
      return const Center(
        child: FydText.b2custom(
          text: 'select a category \n \n or \n \n search with storeId.',
          weight: FontWeight.w600,
          color: fydBbluegrey,
          textAlign: TextAlign.center,
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
              AssetHelper.launch_soon,
              width: 250.w,
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
}

//?-----------------------------------------------------------------------------