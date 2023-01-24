part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required String? orderId,
    required OrderStatus? orderStatus,
    required OrderInfo? orderInfo,
    required CustomerInfo? customerInfo,
    required ShippingInfo? shippingInfo,
    required PaymentInfo? paymentInfo,
    required bool isProcessing,
    required Option<Either<CheckoutFailure, Unit>> failureOrSuccess,
  }) = _CheckoutState;

  factory CheckoutState.empty() => CheckoutState(
        orderId: null,
        orderStatus: null,
        orderInfo: null,
        customerInfo: null,
        shippingInfo: null,
        paymentInfo: null,
        isProcessing: false,
        failureOrSuccess: none(),
      );
  factory CheckoutState.initial() => CheckoutState(
        orderId: null,
        orderStatus: null,
        orderInfo: null,
        customerInfo: null,
        shippingInfo: null,
        paymentInfo: null,
        isProcessing: true,
        failureOrSuccess: none(),
      );
}
