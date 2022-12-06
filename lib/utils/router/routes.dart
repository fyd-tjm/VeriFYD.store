// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/presentation/cart/views/cart_screen.dart';
import 'package:verifyd_store/presentation/checkout/views/confirmation/confirmation_screen.dart';
import 'package:verifyd_store/presentation/checkout/views/delivery/delivery_info_screen.dart';
import 'package:verifyd_store/presentation/checkout/views/delivery/new_address_screen.dart';
import 'package:verifyd_store/presentation/checkout/views/payment/payment_screen.dart';
import 'package:verifyd_store/presentation/core/views/indexed_root.dart';
import 'package:verifyd_store/presentation/core/views/stores_root_screen.dart';

import 'package:verifyd_store/presentation/home/views/home_screen.dart';

import 'package:verifyd_store/presentation/profile/views/profile_screen.dart';
import 'package:verifyd_store/presentation/splash/views/splash_screen.dart';
import 'package:verifyd_store/presentation/stores/views/stores_screen.dart';

import '../../presentation/cart/views/cart_screen.dart';
import '../../presentation/profile/views/edit_profile_screen.dart';
import '../../presentation/profile/sub views/addresses/addresses_screen.dart';
import '../../presentation/profile/sub views/help/help_screen.dart';
import '../../presentation/profile/sub views/orders/views/order_screen.dart';
import '../../presentation/profile/sub views/orders/views/orders_screen.dart';
import 'nav_links.dart';

class AppRoutes {
  AppRoutes._();

  static const String getSplashRoute = NavLinks.SPLASH;
  static const String getPhoneAuthRoute = NavLinks.PHONEAUTH;
  static const String getOtpAuthRoute = NavLinks.OTPAUTH;
  static const String getNameAuthRoute = NavLinks.NAMEAUTH;

  // static const String getRootRoute = NavLinks.ROOT;
  static const String getMainRoute = NavLinks.MAIN;

  static const String getHomeRoute = NavLinks.HOME;
  static const String getStoresRootRoute = NavLinks.STORESROOT;
  static const String getCartRoute = NavLinks.CART;
  static const String getProfileRoute = NavLinks.PROFILE;

  static const String getStoresRoute = NavLinks.STORES;
  static const String getStoreRoute = NavLinks.STORE;
  static const String getStoreInfoRoute = NavLinks.STOREINFO;
  static const String getProductRoute = NavLinks.PRODUCT;

  static const String getDeliveryInfoRoute = NavLinks.DELIVERYINFO;
  static const String getNewAddressRoute = NavLinks.NEWADDRESS;
  static const String getPaymentRoute = NavLinks.PAYMENT;
  static const String getConfirmationRoute = NavLinks.CONFIRMATION;

  static const String getOrdersRoute = NavLinks.ORDERS;
  static const String getOrderRoute = NavLinks.ORDER;
  static const String getAddressesRoute = NavLinks.ADDRESSES;
  static const String getHelpRoute = NavLinks.HELP;
  static const String getEditProfileRoute = NavLinks.EDITPROFILE;

  static const String getSearchScreenRoute = NavLinks.SEARCHSCREEN;

  static const String getPageNotFoundRoute = NavLinks.PAGENOTFOUND;

  //? Navigator Key
  static const int MainNavigatorKey = 0;
  static const int StoresNavigatorKey = 1;

  //! main-GenerateRoute
  static Route<dynamic> mainGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

//!--OnStart----------------

      case AppRoutes.getSplashRoute:
        return GetPageRoute(
          routeName: getSplashRoute,
          page: () => const SplashScreen(),
        );

      case AppRoutes.getMainRoute:
        return GetPageRoute(
          routeName: getMainRoute,
          page: () => const IndexedRoot(),
        );

//!--Auth-------------------

      // case AppRoutes.getPhoneAuthRoute:
      //   return GetPageRoute(
      //     page: () => const PhoneAuthScreen(),
      //     binding: AuthScreenBindings(),
      //     transition: Transition.topLevel,
      //   );

      // case AppRoutes.getOtpAuthRoute:
      //   return GetPageRoute(
      //     page: () => const OtpScreen(),
      //     transition: Transition.rightToLeft,
      //   );

      // case AppRoutes.getNameAuthRoute:
      //   return GetPageRoute(
      //     page: () => const NameScreen(),
      //     binding: AuthScreenBindings(),
      //     transition: Transition.rightToLeft,
      //   );

//!--NavBar Routes----------

      case AppRoutes.getHomeRoute:
        return GetPageRoute(
          routeName: getHomeRoute,
          page: () => const HomeScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getStoresRootRoute:
        return GetPageRoute(
          routeName: getStoresRootRoute,
          page: () => const StoresRootScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getCartRoute:
        return GetPageRoute(
          routeName: getCartRoute,
          page: () => const CartScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getProfileRoute:
        return GetPageRoute(
          routeName: getProfileRoute,
          page: () => const ProfileScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

//!--Cart-Sub-Routes----------

      case getDeliveryInfoRoute:
        return GetPageRoute(
          routeName: getDeliveryInfoRoute,
          page: () => const DeliveryInfoScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case getNewAddressRoute:
        return GetPageRoute(
          routeName: getNewAddressRoute,
          page: () => NewAddressScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case getPaymentRoute:
        return GetPageRoute(
          routeName: getPaymentRoute,
          page: () => const PaymentScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case getConfirmationRoute:
        return GetPageRoute(
          routeName: getConfirmationRoute,
          page: () => const ConfirmationScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

//!--Profile-Sub-Routes----------

      case AppRoutes.getEditProfileRoute:
        return GetPageRoute(
          routeName: getEditProfileRoute,
          page: () => const EditProfileScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getOrdersRoute:
        return GetPageRoute(
          routeName: getOrdersRoute,
          page: () => const OrdersScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getOrderRoute:
        return GetPageRoute(
          routeName: getOrderRoute,
          page: () => const OrderScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getAddressesRoute:
        return GetPageRoute(
          routeName: getAddressesRoute,
          page: () => const AddressesScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );

      case AppRoutes.getHelpRoute:
        return GetPageRoute(
          routeName: getHelpRoute,
          page: () => const HelpScreen(),
          // binding: AuthScreenBindings(),
          // transition: Transition.rightToLeft,
        );
//!--Default-Route---------------

      default:
        return GetPageRoute(
            routeName: getStoresRootRoute,
            page: () => const StoresRootScreen(),
            bindings: [
              // Todo: put it inside core bindings or something
              // SharedInfoBinding(),
            ]);

      //  default:
      // return GetPageRoute(
      //   routeName: getSplashRoute,
      //   page: () => const SplashScreen(),
      // );
    }
  }

  //! stores-GenerateRoute
  static Route<dynamic> storesGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case getStoresRoute:
        return GetPageRoute(
          routeName: getStoresRoute,
          page: () => StoresScreen(),
          bindings: [
            // StoresBinding(),
          ],
        );

      // case getStoreRoute:
      //   {
      //     return GetPageRoute(
      //       routeName: getStoreRoute,
      //       page: () => StoreScreen(),
      //       bindings: [
      //         StoreBinding(store: settings.arguments),
      //       ],
      //     );
      //   }

      // case getStoreInfoRoute:
      //   return GetPageRoute(
      //     routeName: getStoreInfoRoute,
      //     page: () => StoreInfoScreen(),
      //   );

      // case getProductRoute:
      //   return GetPageRoute(
      //       routeName: getProductRoute,
      //       page: () => ProductScreen(),
      //       bindings: [
      //         ProductBinding(product: settings.arguments),
      //       ]);

      default:
        return GetPageRoute(
          routeName: getStoresRoute,
          page: () => StoresScreen(),
          bindings: [
            // StoresBinding(),
          ],
        );
    }
  }
}
