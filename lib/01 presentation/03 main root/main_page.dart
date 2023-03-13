import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';

//?-----------------------------------------------------------------------------

class MainWrapperPage extends StatelessWidget {
  const MainWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<SharedInfoCubit>()..getSharedInfoRealtime(),
        ),
        BlocProvider.value(
          value: getIt<FydUserCubit>(),
        ),
      ],
      child: const MainPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: fydPDgrey,
      resizeToAvoidBottomInset: false,
      routes: const [
        HomeViewWrapperRoute(),
        StoresRouter(),
        CartViewWrapperRoute(),
        ProfileViewWrapperRoute(),
      ],
      animationDuration: const Duration(milliseconds: 300),
      builder: (_, child, animation) => PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          fillColor: fydPDgrey,
          child: child,
        ),
        child: child,
      ),
      bottomNavigationBuilder: (context, tabsRouter) {
        return buildBottomNavigationBar(
          context: context,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) => tabsRouter.setActiveIndex(index),
        );
      },
    );
  }
}

//?-----------------------------------------------------------------------------
Widget buildBottomNavigationBar({
  required BuildContext context,
  required int currentIndex,
  required Function(int) onTap,
}) {
  final isNullState =
      context.select((SharedInfoCubit c) => c.state.sharedInfo == null);
  return PreferredSize(
    preferredSize: Size(double.infinity, 65.5.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [fydLogoBlue, Colors.transparent],
                    begin: Alignment.center,
                    end: Alignment.centerLeft,
                  ),
                ),
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [fydLogoBlue, Colors.transparent],
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
        ),
        CustomNavigationBar(
          elevation: 8,
          iconSize: 35.h,
          selectedColor: fydLogoBlue,
          strokeColor: Colors.transparent,
          unSelectedColor: fydBlueGrey,
          backgroundColor: fydPDgrey,
          scaleFactor: 0.2,
          scaleCurve: Curves.elasticOut,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text('', style: TextStyle(fontSize: 8.h)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.storefront_sharp),
              title: Text('', style: TextStyle(fontSize: 8.h)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: Text('', style: TextStyle(fontSize: 8.h)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              title: Text('', style: TextStyle(fontSize: 8.h)),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            HapticFeedback.mediumImpact();
            isNullState ? null : onTap(index);
          },
        ),
      ],
    ),
  );
}
//?-----------------------------------------------------------------------------