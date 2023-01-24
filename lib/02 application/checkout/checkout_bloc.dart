import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/02%20application/cart/cubit/cart_cubit.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/checkout/checkout_failures.dart';
import 'package:verifyd_store/03%20domain/checkout/customer_info.dart';
import 'package:verifyd_store/03%20domain/checkout/i_checkout_repository.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/checkout/order_Info.dart';
import 'package:verifyd_store/03%20domain/checkout/order_summary.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/checkout/shipping_info.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

@LazySingleton()
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
//?-----------------------------------------------------------------------------
  final CartCubit _cartCubit;
  final FydUserCubit _fydUserCubit;
  final SharedInfoCubit _sharedInfoCubit;
  final ICheckoutRepository _checkoutRepo;
//?-----------------------------------------------------------------------------
  CheckoutBloc(
    this._cartCubit,
    this._fydUserCubit,
    this._sharedInfoCubit,
    this._checkoutRepo,
  ) : super(CheckoutState.empty()) {
//?-----------------------------------------------------------------------------
    //! toggle-failure-or-success state
    on<ToggleFailureOrSuccess>((event, emit) {
      emit(state.copyWith(failureOrSuccess: none()));
    });

//?-----------------------------------------------------------------------------
    //! Add-Order-Info
    on<CheckoutInitialization>((event, emit) {
      //-------
      emit(CheckoutState.initial());
      //-------
      if (_cartCubit.state.cartRealtime != null) {
        // subTotal calculation
        double subTotal = 0;
        for (var cartItem in _cartCubit.state.cartItemsInTuple3!) {
          final price =
              _cartCubit.state.cartItemsDetail![cartItem.value1]!.sellingPrice;
          subTotal += price * cartItem.value3;
        }
        //------
        final orderSummary = OrderSummary(
          totalItems: _cartCubit.state.cartRealtime!.cartCount,
          subTotal: subTotal,
          discount: null,
          shippingCost: null,
          total: null,
        );
        //------
        final orderInfo = OrderInfo(
          storeId: _cartCubit.state.cartRealtime!.cartId,
          storeName: _cartCubit.state.cartRealtime!.storeName,
          orderItems: _cartCubit.state.cartRealtime!.cartItems,
          orderItemsDetail: _cartCubit.state.cartItemsDetail!,
          orderSummary: orderSummary,
        );
        //--------
        final customerInfo = CustomerInfo(
          customerId: _fydUserCubit.state.fydUser!.uId,
          name: _fydUserCubit.state.fydUser!.name,
          phone: _fydUserCubit.state.fydUser!.phone,
          email: _fydUserCubit.state.fydUser!.email,
        );
        //--------
        emit(state.copyWith(
          customerInfo: customerInfo,
          orderInfo: orderInfo,
          isProcessing: false,
          failureOrSuccess: none(),
        ));

        //-------
      } else {
        emit(state.copyWith(
          isProcessing: false,
          failureOrSuccess:
              some(left(const CheckoutFailure.unexpectedFailure(null))),
        ));
      }
      //-------
    });

//?-----------------------------------------------------------------------------
    //! Add-Shipping-Info
    on<AddShippingInfo>((event, emit) {
      //--------
      emit(state.copyWith(
        isProcessing: true,
        failureOrSuccess: none(),
        shippingInfo: null,
      ));
      //--------
      final shippingCost = _sharedInfoCubit.state.sharedInfo?.shippingCost;
      //--------
      if (shippingCost != null) {
        //--------
        final shippingInfo = ShippingInfo(
          shippingAddress: event.shippingAddress,
          shippingCost: shippingCost,
          trackingUrl: '',
        );
        //--------
        emit(state.copyWith(
            isProcessing: false,
            shippingInfo: shippingInfo,
            failureOrSuccess: some(right(unit))));
        //--------
        add(const ToggleFailureOrSuccess());
      } //-------
      else {
        emit(state.copyWith(
          isProcessing: false,
          failureOrSuccess:
              some(left(const CheckoutFailure.unexpectedFailure(null))),
        ));
      }
    });

//?-----------------------------------------------------------------------------
    //! Add-Payment-Info
    on<AddPaymentInfo>((event, emit) async {
      //-------
      emit(state.copyWith(
        isProcessing: true,
        failureOrSuccess: none(),
        paymentInfo: null,
      ));
      //-------
      final orderInfo = OrderInfo(
          storeId: state.orderInfo!.storeId,
          storeName: state.orderInfo!.storeName,
          orderItems: state.orderInfo!.orderItems,
          orderItemsDetail: state.orderInfo!.orderItemsDetail,
          orderSummary: OrderSummary(
            totalItems: state.orderInfo!.orderSummary.totalItems,
            subTotal: state.orderInfo!.orderSummary.subTotal,
            discount: event.discount,
            shippingCost: state.shippingInfo!.shippingCost,
            total: event.total,
          ));
      //-------
      final paymentInfo =
          PaymentInfo(paymentAmount: event.amount, paymentMode: event.mode);
      //-------
      await _cartCubit.cartAvailabilityCheck().then((cartAvailability) async {
        if (cartAvailability == true) {
          //-------
          emit(state.copyWith(
            orderId: null,
            paymentInfo: paymentInfo,
            orderInfo: orderInfo,
            isProcessing: false,
            failureOrSuccess: some(right(unit)),
          ));
          //-------
          add(const ToggleFailureOrSuccess());
        } //------
        else {
          emit(state.copyWith(
            isProcessing: false,
            failureOrSuccess: some(
              left(const CheckoutFailure.cartAvailabilityFailure()),
            ),
          ));
          //------
          add(const ToggleFailureOrSuccess());
        }
      });
      //-------
    });

//?-----------------------------------------------------------------------------
    //! MakePayment
    on<MakePayment>((event, emit) {
      //TODO: Make-Payment Gateway Integration
      emit(state.copyWith(isProcessing: true, failureOrSuccess: none()));
      //-----------
      var paymentSuccess = true;
      if (paymentSuccess == true) {
        //--------
        final paymentInfo = PaymentInfo(
            paymentAmount: state.paymentInfo!.paymentAmount,
            paymentMode: const PaymentMode.online(
              paymentId: '000124jkldsafdks',
            ));
        //--------
        add(OnCheckoutSuccess(paymentInfo: paymentInfo));
      } //-------
      else {
        emit(state.copyWith(
          isProcessing: false,
          failureOrSuccess: some(left(const CheckoutFailure.paymentFailure())),
        ));
        //--------
        add(const ToggleFailureOrSuccess());
        //
      }
    });

//?-----------------------------------------------------------------------------
    //! on-Checkout-Success
    on<OnCheckoutSuccess>((event, emit) async {
      //------//TODO: Handle orderId-Failure
      final orderNumber = 1 + _sharedInfoCubit.state.sharedInfo!.totalOrders;
      final failureOrOrderId = await _checkoutRepo
          .getOrderId(orderNumber: orderNumber)
          .then((failureOrOrderId) =>
              failureOrOrderId.fold((failure) => null, (orderId) => orderId));
      //------
      final fydOrder = FydOrder(
        orderId: failureOrOrderId ?? orderNumber.toString().padLeft(3, '1'),
        orderStatus: const OrderStatus.confirmed(),
        orderInfo: state.orderInfo!,
        shippingInfo: state.shippingInfo!,
        paymentInfo: event.paymentInfo,
        customerInfo: state.customerInfo!,
        orderDate: DateTime.now(),
        deliveryDate: null,
      );
      // add Order to Db via checkout REPO
      //-------
      final result = await _checkoutRepo
          .createOrder(fydOrder: fydOrder)
          .then((failureOrSuccess) => failureOrSuccess);
      //--------
      result.fold(
        (checkoutFailure) {
          emit(state.copyWith(
              isProcessing: false,
              failureOrSuccess: some(left(checkoutFailure))));
          //-------
          add(const ToggleFailureOrSuccess());
        },
        (success) {
          _cartCubit.clearCart();
          emit(state.copyWith(
              isProcessing: false, failureOrSuccess: some(right(success))));
          //-------
          add(const ToggleFailureOrSuccess());
        },
      );
      //--------
    });

//?-----------------------------------------------------------------------------
  } //super
//?-----------------------------------------------------------------------------
} //bloc
