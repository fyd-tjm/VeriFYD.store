// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../01%20presentation/00%20core/landing_page.dart' as _i1;
import '../01%20presentation/01%20login/otp_login_page.dart' as _i5;
import '../01%20presentation/01%20login/phone_login_page.dart' as _i2;
import '../01%20presentation/02%20on%20boarding/on_boarding_page.dart' as _i3;
import '../01%20presentation/test_page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LandingWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingWrapperPage(),
      );
    },
    LoginRouter.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.PhoneLoginWrapperPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideRight,
        durationInMilliseconds: 80,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnBoardingWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OnBoardingWrapperPage(),
      );
    },
    TestWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TestWrapperPage(),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.PhoneLoginPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideRight,
        durationInMilliseconds: 80,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpLoginRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.OtpLoginPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 80,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          LandingWrapperRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRouter.name,
          path: '/phoneLogin',
          children: [
            _i6.RouteConfig(
              PhoneLoginRoute.name,
              path: '',
              parent: LoginRouter.name,
            ),
            _i6.RouteConfig(
              OtpLoginRoute.name,
              path: 'loginOtp',
              parent: LoginRouter.name,
            ),
            _i6.RouteConfig(
              '*#redirect',
              path: '*',
              parent: LoginRouter.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i6.RouteConfig(
          OnBoardingWrapperRoute.name,
          path: '/onBoarding',
        ),
        _i6.RouteConfig(
          TestWrapperRoute.name,
          path: '/testPage',
        ),
      ];
}

/// generated route for
/// [_i1.LandingWrapperPage]
class LandingWrapperRoute extends _i6.PageRouteInfo<void> {
  const LandingWrapperRoute()
      : super(
          LandingWrapperRoute.name,
          path: '/',
        );

  static const String name = 'LandingWrapperRoute';
}

/// generated route for
/// [_i2.PhoneLoginWrapperPage]
class LoginRouter extends _i6.PageRouteInfo<void> {
  const LoginRouter({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          path: '/phoneLogin',
          initialChildren: children,
        );

  static const String name = 'LoginRouter';
}

/// generated route for
/// [_i3.OnBoardingWrapperPage]
class OnBoardingWrapperRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingWrapperRoute()
      : super(
          OnBoardingWrapperRoute.name,
          path: '/onBoarding',
        );

  static const String name = 'OnBoardingWrapperRoute';
}

/// generated route for
/// [_i4.TestWrapperPage]
class TestWrapperRoute extends _i6.PageRouteInfo<void> {
  const TestWrapperRoute()
      : super(
          TestWrapperRoute.name,
          path: '/testPage',
        );

  static const String name = 'TestWrapperRoute';
}

/// generated route for
/// [_i2.PhoneLoginPage]
class PhoneLoginRoute extends _i6.PageRouteInfo<void> {
  const PhoneLoginRoute()
      : super(
          PhoneLoginRoute.name,
          path: '',
        );

  static const String name = 'PhoneLoginRoute';
}

/// generated route for
/// [_i5.OtpLoginPage]
class OtpLoginRoute extends _i6.PageRouteInfo<void> {
  const OtpLoginRoute()
      : super(
          OtpLoginRoute.name,
          path: 'loginOtp',
        );

  static const String name = 'OtpLoginRoute';
}
