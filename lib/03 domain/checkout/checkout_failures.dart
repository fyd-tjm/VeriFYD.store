import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';

part 'checkout_failures.freezed.dart';

@freezed
@immutable
abstract class CheckoutFailure with _$CheckoutFailure {
  const factory CheckoutFailure.cartAvailabilityFailure() =
      CartAvailabilityFailure;
  const factory CheckoutFailure.paymentFailure() = PaymentFailure;
  const factory CheckoutFailure.couponFailure() = CouponFailure;
  const factory CheckoutFailure.orderIdFailure({required String orderNumber}) =
      OrderIdFailure;
  const factory CheckoutFailure.createOrderFailure(
      {required FydOrder fydOrder}) = CreateOrderFailure;
  const factory CheckoutFailure.unexpectedFailure(String? error) =
      UnexpectedFailure;
}
