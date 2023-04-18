import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:verifyd_store/01%20presentation/00%20core/landing_page.dart';
import 'package:verifyd_store/01%20presentation/00%20core/splash_page.dart';
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
import 'package:verifyd_store/01%20presentation/08%20checkout/gateway.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/payment_page.dart';
import 'package:verifyd_store/01%20presentation/09%20address/new_address_page.dart';
import 'package:verifyd_store/01%20presentation/09%20address/update_address_page.dart';
import 'package:verifyd_store/utils/routes/route_transitions.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  durationInMilliseconds: 800,
  transitionsBuilder: TransitionsBldr.sharedAxisHorizontal,
  reverseDurationInMilliseconds: 50,
  routes: [
    //! splash
    CustomRoute(
        path: '/',
        page: SplashPage,
        transitionsBuilder: TransitionsBldr.fadeThrough),
    //! landing
    CustomRoute(
      path: '/landing',
      page: LandingWrapperPage,
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
    CustomRoute(path: '/boarding', page: OnBoardingWrapperPage),
    //! main
    CustomRoute(
        path: '/main',
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
        path: '/editProfile',
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
      path: '/help',
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
      ],
    ),
  ],
)
class $AppRouter {}
