import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import 'widgets/payment_exports.dart';

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------

class PaymentWrapperPage extends StatelessWidget {
  const PaymentWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PaymentPage();
  }
}

//?-----------------------------------------------------------------------------

class PaymentPage extends HookWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPodAvailable =
        getIt<SharedInfoCubit>().state.sharedInfo!.isPodAvailable;
    final selectedPaymentMode = useState<PaymentMode?>(
        (isPodAvailable) ? null : const PaymentMode.online());
    final discountCpn = useState<Coupon?>(null);
    //-------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/checkout/payment') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            //! failure and Success
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
                    paymentFailure: () => null,
                    orderIdFailure: (id) => null,
                    createOrderFailure: (order) => null,
                    //-------
                    unexpectedFailure: (error) {
                      showSnack(
                          context: context,
                          viewType: SnackBarViewType.withNav,
                          message: 'something went wrong!');
                      //-------
                      context.navigateNamedTo(Rn.home);
                    },
                  ), //-------
                  (success) {
                    //-----
                    context.router.replaceAll([const GatewayWrapperRoute()]);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return (state.shippingInfo == null ||
                    state.orderInfo == null ||
                    state.customerInfo == null)
                //! Loading-View
                ? const Center(
                    child: SpinKitWave(
                      color: fydBblue,
                      size: 30.0,
                    ),
                  )
                //! Fyd-View
                : FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 380.h,
                    topSheet: _TopSheet(
                        isPodAvailable: isPodAvailable,
                        selectedPaymentMode: selectedPaymentMode,
                        state: state),
                    bottomSheet: _BottomSheet(
                        selectedPaymentMode: selectedPaymentMode,
                        discountCpn: discountCpn,
                        state: state),
                  );
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final ValueNotifier<PaymentMode?> selectedPaymentMode;
  final CheckoutState state;
  final bool isPodAvailable;
  const _TopSheet({
    super.key,
    required this.isPodAvailable,
    required this.selectedPaymentMode,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! Delivery-Info card
          DeliveryInfoCard(address: state.shippingInfo!.shippingAddress),
          //! payment-mode Heading
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 15.h, left: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: const [
                FydText.b1custom(
                  text: 'Payment Mode',
                  color: Color.fromARGB(255, 60, 69, 249),
                )
              ],
            ),
          ),
          //! Payment-mode Tiles (online : cod)
          Column(
            children: [
              //! online Mode tile
              PaymentTile(
                title: 'online payment',
                paymentMode: const PaymentMode.online(),
                selectedMode: selectedPaymentMode.value,
                onSelect: (mode) {
                  selectedPaymentMode.value = mode;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              //! cod Mode tile
              PaymentTile(
                title: 'pay on delivery',
                paymentMode:
                    (isPodAvailable) ? const PaymentMode.payOnDelivery() : null,
                selectedMode: selectedPaymentMode.value,
                onSelect: (mode) {
                  selectedPaymentMode.value = mode;
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final ValueNotifier<PaymentMode?> selectedPaymentMode;
  final ValueNotifier<Coupon?> discountCpn;
  final CheckoutState state;
  const _BottomSheet({
    super.key,
    required this.selectedPaymentMode,
    required this.discountCpn,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    //-------
    final offers = context
        .select((SharedInfoCubit cubit) => cubit.state.sharedInfo!.offers);
    final storeCoupons = state.coupons!;
    final allCoupons = {...offers, ...storeCoupons};
    final availableCoupons = <String, Coupon>{};
    //--------
    allCoupons.removeWhere((key, value) => ((value.isActive == false) ||
        value.validTill.isBefore(DateTime.now())));

    for (var cpn in allCoupons.values) {
      if (!cpn.isHidden) {
        availableCoupons.addAll({cpn.code: cpn});
      }
    }

    //-------
    final totalItems = state.orderInfo!.orderSummary.totalItems;
    final subTotal = state.orderInfo!.orderSummary.subTotal;
    final shippingCost = state.shippingInfo!.shippingCost;

    //-------
    final total = (subTotal + shippingCost - (discountCpn.value?.value ?? 0))
        .ceil()
        .toDouble();
    //-------
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              //! Coupon-Section
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
                child: FydBtn(
                  height: 50.h,
                  color: fydSblack,
                  onPressed: () async {
                    HapticFeedback.lightImpact();
                    //-----------
                    final cpn = await showSearch(
                      context: context,
                      delegate: CouponSearch(
                        orderSubTotal: subTotal,
                        context: context,
                        searchableCoupons: allCoupons,
                        availableCoupons: availableCoupons,
                        onTap: (v) {},
                      ),
                    );
                    if (cpn != null) {
                      discountCpn.value = cpn;
                    }
                    //-----------
                  },
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //! icon
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Icon(
                          Icons.discount_outlined,
                          size: 25.sp,
                          color: (discountCpn.value != null)
                              ? fydBblue
                              : fydPwhite,
                        ),
                      ),

                      (discountCpn.value != null)
                          ? Expanded(
                              child: FydText.b3custom(
                              text: ': ${discountCpn.value!.code}',
                              weight: FontWeight.w600,
                              color: fydBblue,
                              textAlign: TextAlign.end,
                              letterSpacing: .8,
                            ))
                          //! hint Text
                          : const Expanded(
                              child: FydText.b3white(
                              text: 'apply codes and coupons!',
                              weight: FontWeight.w600,
                              color: fydPwhite,
                            )),
                    ],
                  ),
                ),
              ),
              //! Order-Summary
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: OrderSummarySection(
                  totalItems: totalItems,
                  subTotal: subTotal,
                  shipping: shippingCost,
                  discountCoupon: discountCpn.value,
                  total: total,
                ),
              ),
            ]),
            //! Place Order Btn
            Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
              child: FydBtn(
                height: 60.h,
                color: fydSblack,
                widget: (state.isProcessing)
                    ? const Center(
                        child: SpinKitWave(
                        color: fydBblue,
                        size: 25,
                      ))
                    : const FydText.h3custom(
                        text: 'Place Order',
                        color: fydBblue,
                      ),
                onPressed: () {
                  if (state.isProcessing) return;
                  HapticFeedback.lightImpact();
                  //--------
                  if (selectedPaymentMode.value == null) {
                    showSnack(
                      context: context,
                      message: 'select a Payment option',
                      snackPosition: SnackBarPosition.top,
                    );
                  }
                  //--------
                  else {
                    context.read<CheckoutBloc>().add(AddPaymentInfo(
                          amount: total,
                          mode: selectedPaymentMode.value!,
                          discountCpn: discountCpn.value,
                          total: total,
                        ));
                  }
                },
              ),
            ),
          ]),
    );
  }
}

//?-----------------------------------------------------------------------------

