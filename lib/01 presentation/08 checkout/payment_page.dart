import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/widgets/order_summary_section.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import 'widgets/coupon_search.dart';

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------

class PaymentWrapperPage extends StatelessWidget {
  const PaymentWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CheckoutBloc>(),
        ),
        BlocProvider.value(
          value: getIt<SharedInfoCubit>(),
        ),
      ],
      child: const PaymentPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
//TODO: add remote config condition for pay On Delivery
const remoteCondition = true;

class PaymentPage extends HookWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedPaymentMode = useState<PaymentMode?>(
        (remoteCondition) ? const PaymentMode.online() : null);
    final discountCpn = useState<Coupon?>(null);
    //-------
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<CheckoutBloc, CheckoutState>(
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
                      color: fydLogoBlue,
                      size: 40.0,
                    ),
                  )
                //! Fyd-View
                : FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 380.h,
                    topSheet:
                        _topSheetView(context, selectedPaymentMode, state),
                    bottomSheet: _bottomSheetView(
                        context, selectedPaymentMode, discountCpn, state),
                  );
          },
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------

  _topSheetView(
    BuildContext context,
    ValueNotifier<PaymentMode?> selectedPaymentMode,
    CheckoutState state,
  ) {
    //-------
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
                paymentMode: (remoteCondition)
                    ? null
                    : const PaymentMode.payOnDelivery(),
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

//?-----------------------------------------------------------------------------

  _bottomSheetView(
    BuildContext context,
    ValueNotifier<PaymentMode?> selectedPaymentMode,
    ValueNotifier<Coupon?> discountCpn,
    CheckoutState state,
  ) {
    //-------
    final offers = context
        .select((SharedInfoCubit cubit) => cubit.state.sharedInfo!.offers);
    final storeCoupons = state.coupons!;
    final allCoupons = {...offers, ...storeCoupons};
    final availableCoupons = <String, Coupon>{};
    //--------
    allCoupons.removeWhere((key, value) => ((value.isActive == false) ||
        value.validTill.isBefore(DateTime.now())));

    allCoupons.values.forEach((cpn) {
      if (!cpn.isHidden) {
        availableCoupons.addAll({cpn.code: cpn});
      }
    });

    //-------
    final totalItems = state.orderInfo!.orderSummary.totalItems;
    final subTotal = state.orderInfo!.orderSummary.subTotal;
    final shippingCost = state.shippingInfo!.shippingCost;

    //-------
    final total = (subTotal + shippingCost - (discountCpn.value?.value ?? 0))
        .ceil()
        .toDouble();
    //-------
    log(allCoupons.keys.toString());
    log(availableCoupons.keys.toString());

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
                  color: fydPLgrey.withOpacity(.25),
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
                              ? fydLogoBlue
                              : fydPWhite,
                        ),
                      ),

                      (discountCpn.value != null)
                          ? Expanded(
                              child: FydText.b3custom(
                              text: ': ${discountCpn.value!.code}',
                              weight: FontWeight.w600,
                              color: fydLogoBlue,
                              textAlign: TextAlign.end,
                              letterSpacing: .8,
                            ))
                          //! hint Text
                          : const Expanded(
                              child: FydText.b3white(
                              text: 'apply codes and coupons!',
                              weight: FontWeight.w600,
                              color: fydPWhite,
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
                color: fydPGrey,
                widget: (state.isProcessing)
                    ? const Center(
                        child: SpinKitWave(
                        color: fydLogoBlue,
                        size: 25,
                      ))
                    : const FydText.h3custom(
                        text: 'Place Order',
                        color: fydLogoBlue,
                      ),
                onPressed: () {
                  if (state.isProcessing) return;
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

//?-----------------------------------------------------------------------------
} // PaymentPage

//?-----------------------------------------------------------------------------
//! order-summary-section

//?-----------------------------------------------------------------------------
//! Delivery-info-card

class DeliveryInfoCard extends StatelessWidget {
  final FydAddress address;
  const DeliveryInfoCard({
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line1 = (address.line1);
    final line2 = address.line2;
    final city = (address.city);
    final addressState = (address.state);
    final name = (address.name);
    final phone = Helpers.phoneMaskWithCountryCode(address.phone);

    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: Card(
        color: fydPGrey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! (name : phone : email)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! heading
                  const FydText.b1custom(
                    text: 'Delivery Info',
                    color: fydLogoBlue,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! name
                      FydText.b4white(
                        text: name,
                        weight: FontWeight.w600,
                        color: fydPWhite,
                        letterSpacing: .8,
                      ),
                      //! phone
                      FydText.b4white(
                        text: phone,
                        weight: FontWeight.w600,
                        color: fydPWhite,
                        letterSpacing: .8,
                      ),
                      //! email
                      FydText.b4white(
                        text: address.email,
                        weight: FontWeight.w600,
                        color: fydPWhite,
                        letterSpacing: .8,
                      ),
                    ],
                  ),
                ],
              ),
              //! (line1, line2, city, state, pinCode)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! (al1 + al2)
                  FydEllipsisText(
                    width: 270.w,
                    fydText: FydText.b3custom(
                      text: "$line1, $line2",
                      weight: FontWeight.w600,
                      color: fydBlueGrey,
                    ),
                  ),
                  //! (city + state + pincode)
                  FydEllipsisText(
                    width: 270.w,
                    fydText: FydText.b3custom(
                      text: '$city, $addressState, ${address.pincode}',
                      weight: FontWeight.w600,
                      color: fydBlueGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
//! Payment-tile

class PaymentTile extends StatelessWidget {
  final PaymentMode? paymentMode;
  final String title;
  final PaymentMode? selectedMode;
  final Function(PaymentMode) onSelect;

  const PaymentTile({
    required this.onSelect,
    Key? key,
    required this.paymentMode,
    required this.title,
    required this.selectedMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      height: 60.h,
      color: fydPGrey,
      onPressed: () => (paymentMode == null) ? {} : onSelect(paymentMode!),
      widget: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! title
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: FydText.h3custom(
              text: title,
              color: fydBlueGrey,
              weight: FontWeight.bold,
            ),
          ),
          (paymentMode == null)
              //! comming soon
              ? Padding(
                  padding: EdgeInsets.only(right: 0.w),
                  child: Image.asset(
                    'assets/logo/soon.png',
                    width: 130.w,
                    fit: BoxFit.fitWidth,
                  ),
                )
              //! radio-Btn
              : Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Radio<PaymentMode?>(
                    value: paymentMode,
                    groupValue: selectedMode,
                    onChanged: (v) {
                      onSelect(paymentMode!);
                    },
                    toggleable: false,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.selected)) {
                        return fydLogoBlue;
                      }
                      return fydBlueGrey;
                    }),
                  ),
                ),
        ],
      ),
    );
  }
}

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------
