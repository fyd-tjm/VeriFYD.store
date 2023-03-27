import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/landing_page.dart';
import 'package:verifyd_store/01%20presentation/00%20core/splash_page.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_colors.dart';
import 'package:verifyd_store/01%20presentation/01%20login/otp_login_page.dart';
import 'package:verifyd_store/01%20presentation/01%20login/phone_login_page.dart';
import 'package:verifyd_store/01%20presentation/02%20on%20boarding/on_boarding_page.dart';
import 'package:verifyd_store/01%20presentation/03%20main%20root/main_page.dart';
import 'package:verifyd_store/01%20presentation/04%20home/home_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/product_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_info_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/stores_view_page.dart';
import 'package:verifyd_store/01%20presentation/06%20cart/cart_view_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/edit_profile_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/help_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/order_details_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/orders_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_address_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_view_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/checkout_wrapper_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/confirmation_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/delivery_address_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/error_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/gateway.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/payment_page.dart';
import 'package:verifyd_store/01%20presentation/09%20address/new_address_page.dart';
import 'package:verifyd_store/01%20presentation/09%20address/update_address_page.dart';
import 'package:verifyd_store/01%20presentation/test_page.dart';
import 'package:verifyd_store/aa%20mock/test_store.dart';

class Rn {
  static const splash = '/';
  static const landing = '/landing';
  static const login = '/login';
  static const otp = 'otp';
  static const boarding = '/boarding';

  static const main = '/main';
  static const home = '/main/home';
  static const stores = '/main/stores';
  // static String store({required String storeId}) => 'stores/$storeId';
  // static const storeInfo = '/storeInfo'
  // static const product = '/product';
  static const cart = '/main/cart';
  static const profile = '/main/profile';
  static const editProfile = '/editProfile';
  static const help = '/help';
  static const profileAddress = '/profileAddress';
  static const newAddress = '/newAddress';
  // static const updateAddress = '/updateAddress';
  static const orders = '/orders';
  // static const orderDetails = '/';
  static const checkout = '/checkout';
  static const delivery = '/checkout/delivery';
  static const payment = '/checkout/payment';
  static const gateway = '/checkout/gateway';
  static const confirmation = '/checkout/confirmation';
}

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  durationInMilliseconds: 800,
  transitionsBuilder: TransitionsBldr.sharedAxisHorizontal,
  reverseDurationInMilliseconds: 50,
  routes: [
    //! splash
    CustomRoute(
        path: Rn.splash,
        page: SplashPage,
        transitionsBuilder: TransitionsBldr.fadeThrough),
    //! landing
    CustomRoute(
      path: Rn.landing,
      page: LandingWrapperPage,
      // durationInMilliseconds: 1500
    ),
    //! login-Router
    CustomRoute(
      path: '/login',
      name: 'LoginRouter',
      page: PhoneLoginWrapperPage,
      children: [
        CustomRoute(
          path: '',
          page: PhoneLoginPage,
        ),
        CustomRoute(
          path: 'otp',
          page: OtpLoginPage,
        ),
      ],
    ),
    //! boarding
    CustomRoute(path: Rn.boarding, page: OnBoardingWrapperPage),
    //! main
    CustomRoute(
        path: Rn.main,
        page: MainWrapperPage,
        transitionsBuilder: TransitionsBldr.sharedAxisScale,
        children: [
          //! home
          CustomRoute(path: 'home', page: HomeViewWrapperPage),
          //! stores-Router
          CustomRoute(
              path: 'stores',
              name: 'StoresRouter',
              page: EmptyRouterPage,
              children: [
                //! stores (all-stores)
                CustomRoute(path: '', page: StoresViewWrapperPage),
                //! store
                CustomRoute(path: ':storeId', page: StoreViewWrapperPage),
              ]),
          //! cart
          CustomRoute(path: 'cart', page: CartViewWrapperPage),
          //! profile
          CustomRoute(path: 'profile', page: ProfileViewWrapperPage),
        ]),
    //! product
    CustomRoute(
        path: '/product',
        page: ProductWrapperPage,
        transitionsBuilder: TransitionsBldr.sharedAxisScale),
    //! store-Info
    CustomRoute(path: '/storeInfo', page: StoreInfoWrapperPage),
    //! editProfile
    CustomRoute(
        path: Rn.editProfile,
        page: EditProfileWrapperPage,
        transitionsBuilder: TransitionsBldr.sharedAxisScale),
    //! profileAddress
    CustomRoute(path: '/profileAddress', page: ProfileAddressesWrapperPage),
    //! updateAddress
    CustomRoute(
        path: '/updateAddress',
        page: UpdateAddressWrapperPage,
        transitionsBuilder: TransitionsBldr.sharedAxisScale),
    //! newAddress
    CustomRoute(
        path: '/newAddress',
        page: NewAddressWrapperPage,
        transitionsBuilder: TransitionsBldr.sharedAxisScale),
    //! orders-Router
    CustomRoute(
        path: '/orders',
        name: 'OrdersRouter',
        page: EmptyRouterPage,
        children: [
          CustomRoute(path: '', page: OrdersWrapperPage),
          CustomRoute(path: 'details', page: OrderDetailsWrapperPage),
        ]),
    //! help
    CustomRoute(
      path: Rn.help,
      page: HelpWrapperPage,
    ),
    //! checkout-Router
    CustomRoute(
      path: '/checkout',
      name: 'CheckoutRouter',
      page: CheckoutWrapperPage,
      transitionsBuilder: TransitionsBldr.sharedAxisHorizontal,
      children: [
        RedirectRoute(path: '', redirectTo: 'delivery'),
        CustomRoute(path: 'delivery', page: DeliveryAddressWrapperPage),
        CustomRoute(path: 'payment', page: PaymentWrapperPage),
        CustomRoute(path: 'confirmation', page: ConfirmationWrapperPage),
        CustomRoute(path: 'gateway', page: GatewayWrapperPage),
        CustomRoute(path: 'error', page: CheckoutErrorWrapperPage),
      ],
    ), //todo: Testing page
    CustomRoute(
      path: '/test',
      name: 'testRouter',
      page: EmptyRouterPage,
      durationInMilliseconds: 1000,
      reverseDurationInMilliseconds: 1000,
      children: [
        CustomRoute(
            path: '',
            page: TestWrapperPage,
            transitionsBuilder: TransitionsBldr.sharedAxisHorizontal,
            durationInMilliseconds: 1000,
            reverseDurationInMilliseconds: 500),
        CustomRoute(
            path: 'test2',
            page: TestStoreScreen,
            transitionsBuilder: TransitionsBldr.sharedAxisHorizontal,
            deferredLoading: true,
            durationInMilliseconds: 1000),
      ],
    ),
  ],
)
class $AppRouter {}

class TransitionsBldr {
  const TransitionsBldr._();

  static const RouteTransitionsBuilder sharedAxisScale = _sharedAxisScale;

  static Widget _sharedAxisScale(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.scaled,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder sharedAxisHorizontal =
      _sharedAxisHorizontal;

  static Widget _sharedAxisHorizontal(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.horizontal,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder sharedAxisVertical = _sharedAxisVertical;

  static Widget _sharedAxisVertical(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: SharedAxisTransitionType.vertical,
      fillColor: fydPblack,
      child: child,
    );
  }

  static const RouteTransitionsBuilder fadeScale = _fadeScale;

  static Widget _fadeScale(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeScaleTransition(
      animation: animation,
      child: child,
    );
  }

  static const RouteTransitionsBuilder fadeThrough = _fadeThrough;

  static Widget _fadeThrough(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      fillColor: fydPblack,
      child: child,
    );
  }
}
