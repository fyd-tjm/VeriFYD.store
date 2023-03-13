part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
//?-----------------------------------------------------------------------------
  //! toggle-failure-or-success state
  const factory CheckoutEvent.toggleFailureOrSuccess() = ToggleFailureOrSuccess;

//?-----------------------------------------------------------------------------
  //! Checkout-Initialization
  factory CheckoutEvent.checkoutInitialization() = CheckoutInitialization;

//?-----------------------------------------------------------------------------
  //! Add-Shipping-Info
  factory CheckoutEvent.addShippingInfo({
    required FydAddress shippingAddress,
  }) = AddShippingInfo;

//?-----------------------------------------------------------------------------
  //! Add-Payment-Info
  factory CheckoutEvent.addPaymentInfo({
    required double amount,
    required PaymentMode mode,
    required Coupon? discountCpn,
    required double total,
  }) = AddPaymentInfo;

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------
  //! MakePayment
  factory CheckoutEvent.makePayment() = MakePayment;

//?-----------------------------------------------------------------------------
  //! on-Checkout-Success
  factory CheckoutEvent.onCheckoutSuccess({required PaymentInfo paymentInfo}) =
      OnCheckoutSuccess;

//?-----------------------------------------------------------------------------
  //! on-Checkout-Failure
  factory CheckoutEvent.onCheckoutFailure() = OnCheckoutFailure;

//?-----------------------------------------------------------------------------

}
