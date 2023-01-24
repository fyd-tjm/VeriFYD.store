import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/03%20domain/checkout/customer_info.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/checkout/order_Info.dart';
import 'package:verifyd_store/03%20domain/checkout/order_summary.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/checkout/shipping_info.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../00 ui-core/ui_exports.dart';

//?-----------------------------------------------------------------------------
class GatewayWrapperPage extends StatelessWidget {
  const GatewayWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CheckoutBloc>(),
      child: WillPopScope(
          onWillPop: () async {
            final popResult = await showPermissionDialog(
                context: context,
                message:
                    "Transaction not complete. Discard payment? Press OK to leave, Cancel to stay.",
                falseBtnTitle: 'Cancel',
                trueBtnTitle: 'Ok');
            return popResult ?? false;
          },
          child: const GatewayPage()),
    );
  }
}

//?-----------------------------------------------------------------------------
class GatewayPage extends StatelessWidget {
  const GatewayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listenWhen: (previous, current) {
            // weather on current route or not
            if (context.router.currentPath == Rn.gateway) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                        //-------
                        (failure) => failure.when(
                          cartAvailabilityFailure: () =>
                              context.navigateNamedTo(Rn.cart),
                          //-------
                          paymentFailure: () =>
                              null, //TODO: handle PaymentFailure
                          //-------
                          orderIdFailure: (id) =>
                              null, //TODO: handle orderId-Failure
                          //-------
                          createOrderFailure: (order) => context.navigateTo(
                              ConfirmationWrapperRoute(
                                  orderStatus: OrderStatus.failure(
                                      paymentMode:
                                          order.paymentInfo.paymentMode))),
                          //-------
                          unexpectedFailure: (error) {
                            showSnack(
                                context: context,
                                message: 'something went wrong!');
                            //-------
                            context.navigateNamedTo(Rn.home);
                          },
                        ), //-------
                        (success) {
                          context.router.replace(
                            ConfirmationWrapperRoute(
                                orderStatus: const OrderStatus.success()),
                          );
                        },
                      ));
            }
          },
          buildWhen: (previous, current) {
            // weather on current route or not
            if (context.router.currentPath == Rn.gateway) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 400.h,
              topSheet: topSheetView(context, state),
              bottomSheet: bottomSheetView(context, state),
            );
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  topSheetView(BuildContext context, CheckoutState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: FydBtn(
            height: 60.h,
            color: fydPGrey,
            widget: (state.isProcessing)
                ? const Center(
                    child: SpinKitWave(
                      color: fydLogoBlue,
                      size: 25,
                    ),
                  )
                : FydText.h2custom(
                    text: 'Payment Success',
                    color: fydLogoBlue,
                    weight: FontWeight.bold,
                  ),
            onPressed: () {
              if (state.isProcessing) return;
              //-----
              context.read<CheckoutBloc>().add(MakePayment());
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: FydBtn(
            height: 60.h,
            color: fydPGrey,
            fydText: FydText.h2custom(
              text: 'testing',
              color: fydLogoBlue,
              weight: FontWeight.bold,
            ),
            onPressed: () {
              return;
              final order = FydOrder(
                  orderId: 'orderId',
                  orderStatus: const OrderStatus.confirmed(),
                  orderInfo: const OrderInfo(
                      storeId: 'storeId',
                      storeName: '',
                      orderItems: {},
                      orderItemsDetail: {},
                      orderSummary: OrderSummary(
                          totalItems: 1,
                          subTotal: 1,
                          discount: 1,
                          shippingCost: 1,
                          total: 1)),
                  shippingInfo: ShippingInfo(
                      shippingAddress: MockUi.fydAddress,
                      shippingCost: 20,
                      trackingUrl: ''),
                  paymentInfo: const PaymentInfo(
                      paymentAmount: 20,
                      paymentMode:
                          PaymentMode.online(paymentId: '324ljkdk;astu')),
                  customerInfo: const CustomerInfo(
                      customerId: 'customerId',
                      name: 'name',
                      phone: 'phone',
                      email: 'email'),
                  orderDate: DateTime.now(),
                  deliveryDate: null);
              log(order.toJson().toString());
            },
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
  bottomSheetView(BuildContext context, CheckoutState state) {
    return Column();
  }

//?-----------------------------------------------------------------------------
}
