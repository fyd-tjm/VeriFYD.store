import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';

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
                title: 'Discard Payment?',
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
                          couponFailure: () => null,
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
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
                    child: FydText.d2custom(
                      text: 'Payment Gateway',
                      color: fydBgreen,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: FydText.b1custom(
                      text: 'to be integrated.',
                      color: fydBgreen,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 300.0),
                  child: FydBtn(
                    height: 55,
                    onPressed: () {
                      if (state.isProcessing) return;
                      context.read<CheckoutBloc>().add(MakePayment());
                    },
                    widget: (state.isProcessing)
                        ? const Center(
                            child: SpinKitWave(
                              color: fydBblue,
                              size: 25,
                            ),
                          )
                        : const FydText.b2custom(
                            text: 'Payment Success',
                            color: fydBblue,
                            weight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                    top: 30.0,
                  ),
                  child: FydBtn(
                    height: 55,
                    onPressed: () {},
                    fydText: const FydText.b2custom(
                        text: 'Payment Failure',
                        color: fydBblue,
                        weight: FontWeight.w600),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
