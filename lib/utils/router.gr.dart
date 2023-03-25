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
import 'package:auto_route/auto_route.dart' as _i30;
import 'package:auto_route/empty_router_widgets.dart' as _i12;
import 'package:flutter/material.dart' as _i31;

import '../01%20presentation/00%20core/landing_page.dart' as _i2;
import '../01%20presentation/00%20core/splash_page.dart' as _i1;
import '../01%20presentation/01%20login/otp_login_page.dart' as _i15;
import '../01%20presentation/01%20login/phone_login_page.dart' as _i3;
import '../01%20presentation/02%20on%20boarding/on_boarding_page.dart' as _i4;
import '../01%20presentation/03%20main%20root/main_page.dart' as _i5;
import '../01%20presentation/04%20home/home_view_page.dart' as _i16;
import '../01%20presentation/05%20stores/product_page.dart' as _i6;
import '../01%20presentation/05%20stores/store_info_page.dart' as _i7;
import '../01%20presentation/05%20stores/store_view_page.dart' as _i20;
import '../01%20presentation/05%20stores/stores_view_page.dart' as _i19;
import '../01%20presentation/06%20cart/cart_view_page.dart' as _i17;
import '../01%20presentation/07%20profile/edit_profile_page.dart' as _i8;
import '../01%20presentation/07%20profile/help_page.dart' as _i13;
import '../01%20presentation/07%20profile/order_details_page.dart' as _i22;
import '../01%20presentation/07%20profile/orders_page.dart' as _i21;
import '../01%20presentation/07%20profile/profile_address_page.dart' as _i9;
import '../01%20presentation/07%20profile/profile_view_page.dart' as _i18;
import '../01%20presentation/08%20checkout/checkout_wrapper_page.dart' as _i14;
import '../01%20presentation/08%20checkout/confirmation_page.dart' as _i25;
import '../01%20presentation/08%20checkout/delivery_address_page.dart' as _i23;
import '../01%20presentation/08%20checkout/error_page.dart' as _i27;
import '../01%20presentation/08%20checkout/gateway.dart' as _i26;
import '../01%20presentation/08%20checkout/payment_page.dart' as _i24;
import '../01%20presentation/09%20address/new_address_page.dart' as _i11;
import '../01%20presentation/09%20address/update_address_page.dart' as _i10;
import '../01%20presentation/test_page.dart' as _i28;
import '../03%20domain/checkout/order.dart' as _i35;
import '../03%20domain/store/store.dart' as _i33;
import '../03%20domain/user/address.dart' as _i34;
import '../aa%20mock/test_store.dart' deferred as _i29;
import 'router.dart' as _i32;

class AppRouter extends _i30.RootStackRouter {
  AppRouter([_i31.GlobalKey<_i31.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i30.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
        transitionsBuilder: _i32.TransitionsBldr.fadeThrough,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<LandingWrapperRouteArgs>(
          orElse: () => const LandingWrapperRouteArgs());
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.LandingWrapperPage(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRouter.name: (routeData) {
      final args = routeData.argsAs<LoginRouterArgs>(
          orElse: () => const LoginRouterArgs());
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.PhoneLoginWrapperPage(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnBoardingWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingWrapperRouteArgs>(
          orElse: () => const OnBoardingWrapperRouteArgs());
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.OnBoardingWrapperPage(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<MainWrapperRouteArgs>(
          orElse: () => const MainWrapperRouteArgs());
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.MainWrapperPage(key: args.key),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ProductWrapperRouteArgs>();
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.ProductWrapperPage(
          key: args.key,
          productRef: args.productRef,
        ),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoreInfoWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<StoreInfoWrapperRouteArgs>();
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.StoreInfoWrapperPage(
          key: args.key,
          store: args.store,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    EditProfileWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.EditProfileWrapperPage(),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileAddressesWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileAddressesWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdateAddressWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateAddressWrapperRouteArgs>();
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.UpdateAddressWrapperPage(
          key: args.key,
          existingAddress: args.existingAddress,
          addressIndex: args.addressIndex,
        ),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewAddressWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.NewAddressWrapperPage(),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersRouter.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HelpWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.HelpWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckoutRouter.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.CheckoutWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TestRouter.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
        durationInMilliseconds: 1000,
        reverseDurationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.PhoneLoginPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpLoginRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.OtpLoginPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.HomeViewWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoresRouter.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CartViewWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.CartViewWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileViewWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileViewWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoresViewWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i19.StoresViewWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    StoreViewWrapperRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<StoreViewWrapperRouteArgs>(
          orElse: () => StoreViewWrapperRouteArgs(
              storeId: pathParams.getString('storeId')));
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i20.StoreViewWrapperPage(
          key: args.key,
          storeId: args.storeId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrdersWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i21.OrdersWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrderDetailsWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsWrapperRouteArgs>();
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i22.OrderDetailsWrapperPage(
          key: args.key,
          fydOrder: args.fydOrder,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeliveryAddressWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i23.DeliveryAddressWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i24.PaymentWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ConfirmationWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationWrapperRouteArgs>();
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i25.ConfirmationWrapperPage(
          key: args.key,
          orderStatus: args.orderStatus,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    GatewayWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i26.GatewayWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CheckoutErrorWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i27.CheckoutErrorWrapperPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TestWrapperRoute.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i28.TestWrapperPage(),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisHorizontal,
        durationInMilliseconds: 1000,
        reverseDurationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TestStoreScreen.name: (routeData) {
      return _i30.CustomPage<dynamic>(
        routeData: routeData,
        child: _i30.DeferredWidget(
          _i29.loadLibrary,
          () => _i29.TestStoreScreen(),
        ),
        transitionsBuilder: _i32.TransitionsBldr.sharedAxisHorizontal,
        durationInMilliseconds: 1000,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i30.RouteConfig> get routes => [
        _i30.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i30.RouteConfig(
          LandingWrapperRoute.name,
          path: '/landing',
        ),
        _i30.RouteConfig(
          LoginRouter.name,
          path: '/login',
          children: [
            _i30.RouteConfig(
              PhoneLoginRoute.name,
              path: '',
              parent: LoginRouter.name,
            ),
            _i30.RouteConfig(
              OtpLoginRoute.name,
              path: 'otp',
              parent: LoginRouter.name,
            ),
          ],
        ),
        _i30.RouteConfig(
          OnBoardingWrapperRoute.name,
          path: '/boarding',
        ),
        _i30.RouteConfig(
          MainWrapperRoute.name,
          path: '/main',
          children: [
            _i30.RouteConfig(
              HomeViewWrapperRoute.name,
              path: 'home',
              parent: MainWrapperRoute.name,
            ),
            _i30.RouteConfig(
              StoresRouter.name,
              path: 'stores',
              parent: MainWrapperRoute.name,
              children: [
                _i30.RouteConfig(
                  StoresViewWrapperRoute.name,
                  path: '',
                  parent: StoresRouter.name,
                ),
                _i30.RouteConfig(
                  StoreViewWrapperRoute.name,
                  path: ':storeId',
                  parent: StoresRouter.name,
                ),
              ],
            ),
            _i30.RouteConfig(
              CartViewWrapperRoute.name,
              path: 'cart',
              parent: MainWrapperRoute.name,
            ),
            _i30.RouteConfig(
              ProfileViewWrapperRoute.name,
              path: 'profile',
              parent: MainWrapperRoute.name,
            ),
          ],
        ),
        _i30.RouteConfig(
          ProductWrapperRoute.name,
          path: '/product',
        ),
        _i30.RouteConfig(
          StoreInfoWrapperRoute.name,
          path: '/storeInfo',
        ),
        _i30.RouteConfig(
          EditProfileWrapperRoute.name,
          path: '/editProfile',
        ),
        _i30.RouteConfig(
          ProfileAddressesWrapperRoute.name,
          path: '/profileAddress',
        ),
        _i30.RouteConfig(
          UpdateAddressWrapperRoute.name,
          path: '/updateAddress',
        ),
        _i30.RouteConfig(
          NewAddressWrapperRoute.name,
          path: '/newAddress',
        ),
        _i30.RouteConfig(
          OrdersRouter.name,
          path: '/orders',
          children: [
            _i30.RouteConfig(
              OrdersWrapperRoute.name,
              path: '',
              parent: OrdersRouter.name,
            ),
            _i30.RouteConfig(
              OrderDetailsWrapperRoute.name,
              path: 'details',
              parent: OrdersRouter.name,
            ),
          ],
        ),
        _i30.RouteConfig(
          HelpWrapperRoute.name,
          path: '/help',
        ),
        _i30.RouteConfig(
          CheckoutRouter.name,
          path: '/checkout',
          children: [
            _i30.RouteConfig(
              '#redirect',
              path: '',
              parent: CheckoutRouter.name,
              redirectTo: 'delivery',
              fullMatch: true,
            ),
            _i30.RouteConfig(
              DeliveryAddressWrapperRoute.name,
              path: 'delivery',
              parent: CheckoutRouter.name,
            ),
            _i30.RouteConfig(
              PaymentWrapperRoute.name,
              path: 'payment',
              parent: CheckoutRouter.name,
            ),
            _i30.RouteConfig(
              ConfirmationWrapperRoute.name,
              path: 'confirmation',
              parent: CheckoutRouter.name,
            ),
            _i30.RouteConfig(
              GatewayWrapperRoute.name,
              path: 'gateway',
              parent: CheckoutRouter.name,
            ),
            _i30.RouteConfig(
              CheckoutErrorWrapperRoute.name,
              path: 'error',
              parent: CheckoutRouter.name,
            ),
          ],
        ),
        _i30.RouteConfig(
          TestRouter.name,
          path: '/test',
          children: [
            _i30.RouteConfig(
              TestWrapperRoute.name,
              path: '',
              parent: TestRouter.name,
            ),
            _i30.RouteConfig(
              TestStoreScreen.name,
              path: 'test2',
              parent: TestRouter.name,
              deferredLoading: true,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i30.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LandingWrapperPage]
class LandingWrapperRoute extends _i30.PageRouteInfo<LandingWrapperRouteArgs> {
  LandingWrapperRoute({_i31.Key? key})
      : super(
          LandingWrapperRoute.name,
          path: '/landing',
          args: LandingWrapperRouteArgs(key: key),
        );

  static const String name = 'LandingWrapperRoute';
}

class LandingWrapperRouteArgs {
  const LandingWrapperRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'LandingWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.PhoneLoginWrapperPage]
class LoginRouter extends _i30.PageRouteInfo<LoginRouterArgs> {
  LoginRouter({
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          LoginRouter.name,
          path: '/login',
          args: LoginRouterArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRouter';
}

class LoginRouterArgs {
  const LoginRouterArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'LoginRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.OnBoardingWrapperPage]
class OnBoardingWrapperRoute
    extends _i30.PageRouteInfo<OnBoardingWrapperRouteArgs> {
  OnBoardingWrapperRoute({_i31.Key? key})
      : super(
          OnBoardingWrapperRoute.name,
          path: '/boarding',
          args: OnBoardingWrapperRouteArgs(key: key),
        );

  static const String name = 'OnBoardingWrapperRoute';
}

class OnBoardingWrapperRouteArgs {
  const OnBoardingWrapperRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'OnBoardingWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MainWrapperPage]
class MainWrapperRoute extends _i30.PageRouteInfo<MainWrapperRouteArgs> {
  MainWrapperRoute({
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          MainWrapperRoute.name,
          path: '/main',
          args: MainWrapperRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';
}

class MainWrapperRouteArgs {
  const MainWrapperRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'MainWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ProductWrapperPage]
class ProductWrapperRoute extends _i30.PageRouteInfo<ProductWrapperRouteArgs> {
  ProductWrapperRoute({
    _i31.Key? key,
    required String productRef,
  }) : super(
          ProductWrapperRoute.name,
          path: '/product',
          args: ProductWrapperRouteArgs(
            key: key,
            productRef: productRef,
          ),
        );

  static const String name = 'ProductWrapperRoute';
}

class ProductWrapperRouteArgs {
  const ProductWrapperRouteArgs({
    this.key,
    required this.productRef,
  });

  final _i31.Key? key;

  final String productRef;

  @override
  String toString() {
    return 'ProductWrapperRouteArgs{key: $key, productRef: $productRef}';
  }
}

/// generated route for
/// [_i7.StoreInfoWrapperPage]
class StoreInfoWrapperRoute
    extends _i30.PageRouteInfo<StoreInfoWrapperRouteArgs> {
  StoreInfoWrapperRoute({
    _i31.Key? key,
    required _i33.Store store,
  }) : super(
          StoreInfoWrapperRoute.name,
          path: '/storeInfo',
          args: StoreInfoWrapperRouteArgs(
            key: key,
            store: store,
          ),
        );

  static const String name = 'StoreInfoWrapperRoute';
}

class StoreInfoWrapperRouteArgs {
  const StoreInfoWrapperRouteArgs({
    this.key,
    required this.store,
  });

  final _i31.Key? key;

  final _i33.Store store;

  @override
  String toString() {
    return 'StoreInfoWrapperRouteArgs{key: $key, store: $store}';
  }
}

/// generated route for
/// [_i8.EditProfileWrapperPage]
class EditProfileWrapperRoute extends _i30.PageRouteInfo<void> {
  const EditProfileWrapperRoute()
      : super(
          EditProfileWrapperRoute.name,
          path: '/editProfile',
        );

  static const String name = 'EditProfileWrapperRoute';
}

/// generated route for
/// [_i9.ProfileAddressesWrapperPage]
class ProfileAddressesWrapperRoute extends _i30.PageRouteInfo<void> {
  const ProfileAddressesWrapperRoute()
      : super(
          ProfileAddressesWrapperRoute.name,
          path: '/profileAddress',
        );

  static const String name = 'ProfileAddressesWrapperRoute';
}

/// generated route for
/// [_i10.UpdateAddressWrapperPage]
class UpdateAddressWrapperRoute
    extends _i30.PageRouteInfo<UpdateAddressWrapperRouteArgs> {
  UpdateAddressWrapperRoute({
    _i31.Key? key,
    required _i34.FydAddress existingAddress,
    required int addressIndex,
  }) : super(
          UpdateAddressWrapperRoute.name,
          path: '/updateAddress',
          args: UpdateAddressWrapperRouteArgs(
            key: key,
            existingAddress: existingAddress,
            addressIndex: addressIndex,
          ),
        );

  static const String name = 'UpdateAddressWrapperRoute';
}

class UpdateAddressWrapperRouteArgs {
  const UpdateAddressWrapperRouteArgs({
    this.key,
    required this.existingAddress,
    required this.addressIndex,
  });

  final _i31.Key? key;

  final _i34.FydAddress existingAddress;

  final int addressIndex;

  @override
  String toString() {
    return 'UpdateAddressWrapperRouteArgs{key: $key, existingAddress: $existingAddress, addressIndex: $addressIndex}';
  }
}

/// generated route for
/// [_i11.NewAddressWrapperPage]
class NewAddressWrapperRoute extends _i30.PageRouteInfo<void> {
  const NewAddressWrapperRoute()
      : super(
          NewAddressWrapperRoute.name,
          path: '/newAddress',
        );

  static const String name = 'NewAddressWrapperRoute';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class OrdersRouter extends _i30.PageRouteInfo<void> {
  const OrdersRouter({List<_i30.PageRouteInfo>? children})
      : super(
          OrdersRouter.name,
          path: '/orders',
          initialChildren: children,
        );

  static const String name = 'OrdersRouter';
}

/// generated route for
/// [_i13.HelpWrapperPage]
class HelpWrapperRoute extends _i30.PageRouteInfo<void> {
  const HelpWrapperRoute()
      : super(
          HelpWrapperRoute.name,
          path: '/help',
        );

  static const String name = 'HelpWrapperRoute';
}

/// generated route for
/// [_i14.CheckoutWrapperPage]
class CheckoutRouter extends _i30.PageRouteInfo<void> {
  const CheckoutRouter({List<_i30.PageRouteInfo>? children})
      : super(
          CheckoutRouter.name,
          path: '/checkout',
          initialChildren: children,
        );

  static const String name = 'CheckoutRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class TestRouter extends _i30.PageRouteInfo<void> {
  const TestRouter({List<_i30.PageRouteInfo>? children})
      : super(
          TestRouter.name,
          path: '/test',
          initialChildren: children,
        );

  static const String name = 'TestRouter';
}

/// generated route for
/// [_i3.PhoneLoginPage]
class PhoneLoginRoute extends _i30.PageRouteInfo<void> {
  const PhoneLoginRoute()
      : super(
          PhoneLoginRoute.name,
          path: '',
        );

  static const String name = 'PhoneLoginRoute';
}

/// generated route for
/// [_i15.OtpLoginPage]
class OtpLoginRoute extends _i30.PageRouteInfo<void> {
  const OtpLoginRoute()
      : super(
          OtpLoginRoute.name,
          path: 'otp',
        );

  static const String name = 'OtpLoginRoute';
}

/// generated route for
/// [_i16.HomeViewWrapperPage]
class HomeViewWrapperRoute extends _i30.PageRouteInfo<void> {
  const HomeViewWrapperRoute()
      : super(
          HomeViewWrapperRoute.name,
          path: 'home',
        );

  static const String name = 'HomeViewWrapperRoute';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class StoresRouter extends _i30.PageRouteInfo<void> {
  const StoresRouter({List<_i30.PageRouteInfo>? children})
      : super(
          StoresRouter.name,
          path: 'stores',
          initialChildren: children,
        );

  static const String name = 'StoresRouter';
}

/// generated route for
/// [_i17.CartViewWrapperPage]
class CartViewWrapperRoute extends _i30.PageRouteInfo<void> {
  const CartViewWrapperRoute()
      : super(
          CartViewWrapperRoute.name,
          path: 'cart',
        );

  static const String name = 'CartViewWrapperRoute';
}

/// generated route for
/// [_i18.ProfileViewWrapperPage]
class ProfileViewWrapperRoute extends _i30.PageRouteInfo<void> {
  const ProfileViewWrapperRoute()
      : super(
          ProfileViewWrapperRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileViewWrapperRoute';
}

/// generated route for
/// [_i19.StoresViewWrapperPage]
class StoresViewWrapperRoute extends _i30.PageRouteInfo<void> {
  const StoresViewWrapperRoute()
      : super(
          StoresViewWrapperRoute.name,
          path: '',
        );

  static const String name = 'StoresViewWrapperRoute';
}

/// generated route for
/// [_i20.StoreViewWrapperPage]
class StoreViewWrapperRoute
    extends _i30.PageRouteInfo<StoreViewWrapperRouteArgs> {
  StoreViewWrapperRoute({
    _i31.Key? key,
    required String storeId,
  }) : super(
          StoreViewWrapperRoute.name,
          path: ':storeId',
          args: StoreViewWrapperRouteArgs(
            key: key,
            storeId: storeId,
          ),
          rawPathParams: {'storeId': storeId},
        );

  static const String name = 'StoreViewWrapperRoute';
}

class StoreViewWrapperRouteArgs {
  const StoreViewWrapperRouteArgs({
    this.key,
    required this.storeId,
  });

  final _i31.Key? key;

  final String storeId;

  @override
  String toString() {
    return 'StoreViewWrapperRouteArgs{key: $key, storeId: $storeId}';
  }
}

/// generated route for
/// [_i21.OrdersWrapperPage]
class OrdersWrapperRoute extends _i30.PageRouteInfo<void> {
  const OrdersWrapperRoute()
      : super(
          OrdersWrapperRoute.name,
          path: '',
        );

  static const String name = 'OrdersWrapperRoute';
}

/// generated route for
/// [_i22.OrderDetailsWrapperPage]
class OrderDetailsWrapperRoute
    extends _i30.PageRouteInfo<OrderDetailsWrapperRouteArgs> {
  OrderDetailsWrapperRoute({
    _i31.Key? key,
    required _i35.FydOrder fydOrder,
  }) : super(
          OrderDetailsWrapperRoute.name,
          path: 'details',
          args: OrderDetailsWrapperRouteArgs(
            key: key,
            fydOrder: fydOrder,
          ),
        );

  static const String name = 'OrderDetailsWrapperRoute';
}

class OrderDetailsWrapperRouteArgs {
  const OrderDetailsWrapperRouteArgs({
    this.key,
    required this.fydOrder,
  });

  final _i31.Key? key;

  final _i35.FydOrder fydOrder;

  @override
  String toString() {
    return 'OrderDetailsWrapperRouteArgs{key: $key, fydOrder: $fydOrder}';
  }
}

/// generated route for
/// [_i23.DeliveryAddressWrapperPage]
class DeliveryAddressWrapperRoute extends _i30.PageRouteInfo<void> {
  const DeliveryAddressWrapperRoute()
      : super(
          DeliveryAddressWrapperRoute.name,
          path: 'delivery',
        );

  static const String name = 'DeliveryAddressWrapperRoute';
}

/// generated route for
/// [_i24.PaymentWrapperPage]
class PaymentWrapperRoute extends _i30.PageRouteInfo<void> {
  const PaymentWrapperRoute()
      : super(
          PaymentWrapperRoute.name,
          path: 'payment',
        );

  static const String name = 'PaymentWrapperRoute';
}

/// generated route for
/// [_i25.ConfirmationWrapperPage]
class ConfirmationWrapperRoute
    extends _i30.PageRouteInfo<ConfirmationWrapperRouteArgs> {
  ConfirmationWrapperRoute({
    _i31.Key? key,
    required _i35.OrderStatus orderStatus,
  }) : super(
          ConfirmationWrapperRoute.name,
          path: 'confirmation',
          args: ConfirmationWrapperRouteArgs(
            key: key,
            orderStatus: orderStatus,
          ),
        );

  static const String name = 'ConfirmationWrapperRoute';
}

class ConfirmationWrapperRouteArgs {
  const ConfirmationWrapperRouteArgs({
    this.key,
    required this.orderStatus,
  });

  final _i31.Key? key;

  final _i35.OrderStatus orderStatus;

  @override
  String toString() {
    return 'ConfirmationWrapperRouteArgs{key: $key, orderStatus: $orderStatus}';
  }
}

/// generated route for
/// [_i26.GatewayWrapperPage]
class GatewayWrapperRoute extends _i30.PageRouteInfo<void> {
  const GatewayWrapperRoute()
      : super(
          GatewayWrapperRoute.name,
          path: 'gateway',
        );

  static const String name = 'GatewayWrapperRoute';
}

/// generated route for
/// [_i27.CheckoutErrorWrapperPage]
class CheckoutErrorWrapperRoute extends _i30.PageRouteInfo<void> {
  const CheckoutErrorWrapperRoute()
      : super(
          CheckoutErrorWrapperRoute.name,
          path: 'error',
        );

  static const String name = 'CheckoutErrorWrapperRoute';
}

/// generated route for
/// [_i28.TestWrapperPage]
class TestWrapperRoute extends _i30.PageRouteInfo<void> {
  const TestWrapperRoute()
      : super(
          TestWrapperRoute.name,
          path: '',
        );

  static const String name = 'TestWrapperRoute';
}

/// generated route for
/// [_i29.TestStoreScreen]
class TestStoreScreen extends _i30.PageRouteInfo<void> {
  const TestStoreScreen()
      : super(
          TestStoreScreen.name,
          path: 'test2',
        );

  static const String name = 'TestStoreScreen';
}
