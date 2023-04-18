import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';

@lazySingleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  // Sets the user ID property if available.
  void setUserId() async {
    _analytics.setUserId(
      id: FirebaseAuth.instance.currentUser?.uid,
    );
  }

  // log Store-Visit
  void logStoreVisit({required String storeId}) async {
    await _analytics.logEvent(
      name: 'store_visit',
      parameters: {
        'store_id': storeId,
      },
    );
  }

  // Product-View
  void logProductView({required Product product}) async {
    await _analytics.logEvent(
      name: 'product_view',
      parameters: {
        'store_id': product.storeId,
        'sku_id': product.skuId,
        'product_type': product.type,
      },
    );
  }

  // Adding-To-Cart
  void logAddingToCart({required Product product}) async {
    await _analytics.logEvent(
      name: 'adding_to_cart',
      parameters: {
        'store_id': product.storeId,
        'product_type': product.type,
      },
    );
  }

  // Proceed-To-Checkout
  void logProceedToCheckout({
    required String storeId,
    required double subTotal,
    required int itemCount,
  }) async {
    await _analytics.logEvent(
      name: 'proceed_to_checkout',
      parameters: {
        'store_id': storeId,
        'sub_total': subTotal,
        'item_count': itemCount,
      },
    );
  }

  // delivery-info-added
  void logAddressInfoAdded({
    required int pincode,
    required String state,
  }) async {
    await _analytics.logEvent(
      name: 'address_info_added',
      parameters: {
        'pincode': pincode,
        'state': state,
      },
    );
  }

  // help-needed
  void logHelpNeeded({
    required String helpBy,
  }) async {
    await _analytics.logEvent(
      name: 'help_needed',
      parameters: {
        'help_by': helpBy,
      },
    );
  }
  // todo : proceed-to-pay
  // todo : payment-confirmation
  // todo : order-confirmation

  // log auth-error
  void logAuthException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'auth_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // log shared-info-exception
  void logSharedInfoException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'shared_info_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // log store-exception
  void logStoreException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'store_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // product-exception
  void logProductException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'product_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // log cart-exception
  void logCartException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'cart_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // log user-exception
  void logUserException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'user_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  // todo: checkout-exception
  void logCheckoutException({required String errorMessage}) async {
    await _analytics.logEvent(
      name: 'checkout_exception',
      parameters: {
        'error_message': errorMessage,
      },
    );
  }

  //Test-Case
  void testCase() async {}
}
