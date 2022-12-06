import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';

class StartApp extends StatelessWidget {
  StartApp({Key? key}) : super(key: key);
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 890),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => getIt<FydUserCubit>(),
            child: MaterialApp.router(
              title: 'veriFYD.store',
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [MainRouterObserver()],
              ),
              routeInformationParser: appRouter.defaultRouteParser(),
            ),
          );
        });
  }
}

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
