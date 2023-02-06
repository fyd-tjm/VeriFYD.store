import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

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
      ],
      child: const PaymentPage(),
    );
  }
}

//?-----------------------------------------------------------------------------

class PaymentPage extends HookWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-------
    final selectedPaymentMode = useState<PaymentMode?>(null);
    //-------
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      //-------
      listenWhen: (previous, current) {
        // weather on current route or not
        return context.router.isPathActive(Rn.payment);
      },
      //-------
      listener: (context, state) {
        //failure Or Success
        if (state.failureOrSuccess.isSome()) {
          state.failureOrSuccess.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              //-------
              (failure) => failure.when(
                cartAvailabilityFailure: () => context.navigateNamedTo(Rn.cart),
                //-------
                paymentFailure: () => null,
                orderIdFailure: (id) => null,
                createOrderFailure: (order) => null,
                //-------
                unexpectedFailure: (error) {
                  showSnack(context: context, message: 'something went wrong!');
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
      //-------
      buildWhen: (previous, current) {
        // weather on current route or not
        return context.router.isPathActive(Rn.payment);
      },
      //-------
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: (state.shippingInfo == null ||
                    state.orderInfo == null ||
                    state.customerInfo == null)
                //Loading-View
                ? const Center(
                    child: SpinKitWave(
                      color: fydLogoBlue,
                      size: 40.0,
                    ),
                  )
                // Payment-View
                : FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 400.h,
                    topSheet:
                        _topSheetView(context, selectedPaymentMode, state),
                    bottomSheet:
                        _bottomSheetView(context, selectedPaymentMode, state),
                  ),
          ),
        );
      },
      //-------
    );
  }
//?-----------------------------------------------------------------------------

  _topSheetView(BuildContext context,
      ValueNotifier<PaymentMode?> selectedPaymentMode, CheckoutState state) {
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
            padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Select Payment Mode',
                  style: GoogleFonts.exo2(
                    color: fydLogoBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          ),
          //! Payment-mode Tiles (online : cod)
          Column(
            children: [
              // online Mode tile
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
              // cod Mode tile
              PaymentTile(
                title: 'cash on delivery',
                paymentMode: const PaymentMode.payOnDelivery(),
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

  _bottomSheetView(BuildContext context,
      ValueNotifier<PaymentMode?> selectedPaymentMode, CheckoutState state) {
    //-------
    final totalItems = state.orderInfo!.orderSummary.totalItems;
    final subTotal = state.orderInfo!.orderSummary.subTotal;
    final shippingCost = state.shippingInfo!.shippingCost;
    const discount = 50.0;
    //-------
    final total = (subTotal + shippingCost - (discount)).ceil().toDouble();
    //-------
    return Padding(
      padding:
          EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w, bottom: 20.h),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              //TODO: Discount-Section
              SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Card(
                  color: fydPLgrey.withOpacity(.3),
                  elevation: 25.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //! icon
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Icon(
                          Icons.discount_outlined,
                          size: 25.sp,
                          color: fydPWhite,
                        ),
                      ),

                      //! hint Text
                      Expanded(
                          child: FydText.b3white(
                        text: 'apply codes and offers!',
                        weight: FontWeight.w600,
                      )),
                    ],
                  ),
                ),
              ),
              //! Order-Summary
              OrderSummarySection(
                totalItems: totalItems,
                subTotal: subTotal,
                shipping: shippingCost,
                discount: discount,
                total: total,
              ),
            ]),
            //! Place Order Btn
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
                      ))
                    : FydText.h2custom(
                        text: 'Place Order',
                        color: fydLogoBlue,
                        weight: FontWeight.bold,
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
                          discount: discount,
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
class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    Key? key,
    required this.totalItems,
    required this.subTotal,
    required this.shipping,
    required this.discount,
    required this.total,
  }) : super(key: key);
  final int totalItems;
  final double subTotal;
  final double shipping;
  final double? discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        children: [
          //!subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FydText.b2custom(
                text: 'sub Total ($totalItems items)',
                color: fydPLgrey,
                weight: FontWeight.bold,
              ),
              Text(
                '+  $subTotal',
                style: GoogleFonts.exo2(
                  fontWeight: FontWeight.w600,
                  color: fydBlueGrey,
                  fontSize: 22,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          //!shipping
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FydText.b2custom(
                text: 'Shipping',
                color: fydPLgrey,
                weight: FontWeight.bold,
              ),
              Text(
                '+  $shipping',
                style: GoogleFonts.exo2(
                  fontWeight: FontWeight.w600,
                  color: fydBlueGrey,
                  fontSize: 22,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          //!Discount
          (discount == null)
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FydText.b2custom(
                      text: 'Discount',
                      color: fydPLgrey,
                      weight: FontWeight.bold,
                    ),
                    Text(
                      '-  $discount',
                      style: GoogleFonts.exo2(
                        fontWeight: FontWeight.w600,
                        color: fydBlueGrey,
                        fontSize: 22,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
          Divider(
            height: 20.h,
            color: fydPWhite,
          ),
          //!total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FydText.b1custom(
                text: 'Total',
                color: fydGreyWhite,
                weight: FontWeight.bold,
              ),
              Text(
                '₹ $total',
                style: GoogleFonts.exo2(
                  fontWeight: FontWeight.w600,
                  color: fydLogoBlue,
                  fontSize: 22,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
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
                  FydText.b1custom(
                    text: 'Delivery Info',
                    weight: FontWeight.bold,
                    color: fydLogoBlue,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FydText.b3custom(
                        text: name,
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                      FydText.b3custom(
                        text: phone,
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                      FydText.b3custom(
                        text: address.email,
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                    ],
                  ),
                ],
              ),
              //! (line1, line2, city, state, pinCode)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // (al1 + al2)
                  FydTextEllipsis(
                    width: 260.w,
                    fydText: FydText.b3white(
                      text: "$line1, $line2",
                      weight: FontWeight.w600,
                    ),
                  ),
                  // (city + state + pincode)
                  FydTextEllipsis(
                    width: 260.w,
                    fydText: FydText.b3white(
                      text: '$city, $addressState, ${address.pincode}',
                      weight: FontWeight.w600,
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
  final PaymentMode paymentMode;
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
      height: 70.h,
      color: fydPGrey,
      onPressed: () => onSelect(paymentMode),
      widget: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // title
          FydText.h3custom(
            text: title,
            color: fydBlueGrey,
            weight: FontWeight.bold,
          ),
          // radio-Btn
          Radio(
            value: paymentMode,
            groupValue: selectedMode,
            onChanged: (v) {
              // onSelect(paymentMode);
            },
            toggleable: false,
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return fydLogoBlue;
              }
              return fydBlueGrey;
            }),
          ),
        ],
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
//! Summary-section

//?-----------------------------------------------------------------------------
