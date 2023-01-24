import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/checkout/checkout_failures.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';

abstract class ICheckoutRepository {
  //! create Order
  Future<Either<CheckoutFailure, Unit>> createOrder(
      {required FydOrder fydOrder});

  //! get OrderId
  Future<Either<CheckoutFailure, String>> getOrderId(
      {required int orderNumber});
}
