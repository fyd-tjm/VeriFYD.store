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
import 'package:verifyd_store/01%20presentation/05%20stores/store_info_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/store_view_page.dart';
import 'package:verifyd_store/01%20presentation/05%20stores/stores_view_page.dart';
import 'package:verifyd_store/01%20presentation/06%20cart/cart_view_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/edit_profile_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/help_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/new_address_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/order_details_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/orders_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_address_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_view_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/update_address_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/checkout_wrapper_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/confirmation_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/delivery_address_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/error_page.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/gateway.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/payment_page.dart';
import 'package:verifyd_store/01%20presentation/test_page.dart';

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

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  routes: [
    //! splash
    AutoRoute(path: Rn.splash, page: SplashPage),
    //! landing
    AutoRoute(path: Rn.landing, page: LandingWrapperPage),
    //! login-Router
    AutoRoute(
      path: Rn.login,
      name: 'LoginRouter',
      page: PhoneLoginWrapperPage,
      children: [
        AutoRoute(
          path: '',
          page: PhoneLoginPage,
        ),
        CustomRoute(
          path: 'otp',
          page: OtpLoginPage,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 150,
        ),
      ],
    ),
    //! boarding-Router
    AutoRoute(path: Rn.boarding, page: OnBoardingWrapperPage),
    //! main
    AutoRoute(path: Rn.main, page: MainWrapperPage, children: [
      //! home
      AutoRoute(path: 'home', page: HomeViewWrapperPage),
      //! stores-Router
      AutoRoute(
          path: 'stores',
          name: 'StoresRouter',
          page: EmptyRouterPage,
          children: [
            //! stores (all-stores)
            AutoRoute(path: '', page: StoresViewWrapperPage),
            //! store
            AutoRoute(path: ':storeId', page: StoreViewWrapperPage),
          ]),
      //! cart
      AutoRoute(path: 'cart', page: CartViewWrapperPage),
      //! profile
      AutoRoute(path: 'profile', page: ProfileViewWrapperPage),
    ]),
    //! product
    AutoRoute(path: '/product', page: ProductWrapperPage),
    //! store-Info
    AutoRoute(path: '/storeInfo', page: StoreInfoViewWrapperPage),
    //! editProfile
    AutoRoute(path: Rn.editProfile, page: EditProfileWrapperPage),
    //! profileAddress
    AutoRoute(path: Rn.profileAddress, page: ProfileAddressesWrapperPage),
    //! updateAddress
    AutoRoute(path: '/updateAddress', page: UpdateAddressWrapperPage),
    //! newAddress
    AutoRoute(path: Rn.newAddress, page: NewAddressWrapperPage),
    //! orders-Router
    AutoRoute(
        path: Rn.orders,
        name: 'OrdersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: OrdersWrapperPage),
          AutoRoute(path: 'details', page: OrderDetailsWrapperPage),
        ]),
    //! help
    AutoRoute(path: Rn.help, page: HelpWrapperPage),
    //! checkout-Router
    AutoRoute(
      path: Rn.checkout,
      name: 'CheckoutRouter',
      page: CheckoutWrapperPage,
      children: [
        RedirectRoute(path: '', redirectTo: 'delivery'),
        AutoRoute(path: 'delivery', page: DeliveryAddressWrapperPage),
        AutoRoute(path: 'payment', page: PaymentWrapperPage),
        AutoRoute(path: 'confirmation', page: ConfirmationWrapperPage),
        AutoRoute(path: 'gateway', page: GatewayWrapperPage),
        AutoRoute(path: 'error', page: CheckoutErrorWrapperPage),
      ],
    ), //todo: Testing page
    AutoRoute(
      path: '/test',
      name: 'testRouter',
      page: EmptyRouterPage,
      children: [AutoRoute(path: '', page: TestWrapperPage)],
    ),
  ],
)
class $AppRouter {}
