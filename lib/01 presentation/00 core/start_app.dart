// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/core/network/network_cubit.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';

//?-----------------------------------------------------------------------------
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
                  navigatorObservers: () => [MainRouterObserver()]),
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
//! bloc observer ---- in void-main()
class MyGlobalObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent Bloc-- ${bloc.runtimeType} -- ${event.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange Bloc type-- ${bloc.runtimeType} ');
    // print('onChange Bloc CurrentState-- ${change.currentState}');
    // print('onChange Bloc NextState-- ${change.nextState}');
  }

// @override
// void onTransition(Bloc bloc, Transition transition) {
//   super.onTransition(bloc, transition);
//   debugPrint('${bloc.runtimeType} $transition');
// }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError Bloc-- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }
}
//?-----------------------------------------------------------------------------

//! route observer
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
