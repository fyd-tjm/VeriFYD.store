import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/checkout/checkout_failures.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';

abstract class ICheckoutRepository {
  //! get Store's coupons
  Future<Either<CheckoutFailure, Map<String, Coupon>>> getStoreCoupons(
      {required String storeRef});
  //! create Order
  Future<Either<CheckoutFailure, Unit>> createOrder(
      {required FydOrder fydOrder});

  //! get OrderId
  Future<Either<CheckoutFailure, String>> getOrderId(
      {required int orderNumber});
}
