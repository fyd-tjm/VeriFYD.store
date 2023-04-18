// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/02%20application/core/network/network_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

import 'widgets/fyd_colors.dart';

//?-----------------------------------------------------------------------------
class StartApp extends StatelessWidget {
  final bool useDebugMode;
  StartApp({Key? key, required this.useDebugMode}) : super(key: key);
  final appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 890),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<NetworkCubit>(),
              ),
            ],
            child: MaterialApp.router(
              title: 'veriFYD.store',
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [
                  if (useDebugMode) MainRouterObserver(),
                  getIt<AnalyticsService>().observer,
                ],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: fydPblack,
                textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: fydBblue),
                pageTransitionsTheme: const PageTransitionsTheme(builders: {
                  TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                    transitionType: SharedAxisTransitionType.horizontal,
                  ),
                }),
              ),
            ),
          );
        });
  }
}

//?-----------------------------------------------------------------------------
// route observer
class MainRouterObserver extends AutoRouterObserver {
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log('replaced: ${oldRoute?.settings.name} ➡️ ${newRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log('removed: ➡️ ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log('pushed: ➡️ ${route.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('poped: ➡️ ${route.settings.name}');
    super.didPop(route, previousRoute);
  }
}

//?-----------------------------------------------------------------------------
