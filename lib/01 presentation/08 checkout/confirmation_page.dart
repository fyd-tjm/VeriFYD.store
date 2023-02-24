import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/utils/router.dart';

//?-----------------------------------------------------------------------------

class ConfirmationWrapperPage extends StatelessWidget {
  const ConfirmationWrapperPage({Key? key, required this.orderStatus})
      : super(key: key);
  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: ConfirmationPage(
          orderStatus: orderStatus,
        ));
  }
}

//?-----------------------------------------------------------------------------

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({Key? key, required this.orderStatus})
      : super(key: key);
  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    //----------
    final bool? isSuccessFull = orderStatus.when(
        failure: (v) => false,
        success: () => true,
        confirmed: () => null,
        declined: () => null,
        shipped: () => null,
        delivered: (date) => null,
        fullFilled: () => null,
        refunded: (id) => null);
    //----------
    return SafeArea(
      child: Scaffold(
        body: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 500.h,
          topSheetColor: fydTWhite,
          topSheet: _topSheetView(context, isSuccessFull!),
          bottomSheet: _bottomSheetView(context, isSuccessFull),
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------

  _topSheetView(BuildContext context, bool isSuccessFull) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //!  (Heading : gif : message)
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! Heading
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
              child: Center(
                child: FydText.d2custom(
                  text: (isSuccessFull) ? 'success!' : 'failure!',
                  letterSpacing: .8,
                  color: (isSuccessFull)
                      ? const Color.fromARGB(255, 70, 182, 5)
                      : const Color.fromARGB(255, 213, 75, 75),
                ),
              ),
            ),
            //! gif
            Image.asset(
                (isSuccessFull)
                    ? 'assets/gifs/success1.gif'
                    : 'assets/gifs/cancled1.gif',
                height: (isSuccessFull) ? 220.h : 160.h,
                fit: BoxFit.contain,
                scale: 1,
                repeat: ImageRepeat.noRepeat),
            // spacing
            (isSuccessFull)
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 20.h,
                  ),
            //! Order-Info
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FydText.b3custom(
                    text: (isSuccessFull) ? 'order-id: ' : 'payment-id: ',
                    color: fydPLgrey,
                    weight: FontWeight.w600,
                  ),
                  FydText.b3custom(
                      text: (isSuccessFull) ? '#A001254' : 'cde3120023',
                      color: fydLogoBlue)
                ],
              ),
            ),

            //! message section
            Padding(
              padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
              child: FydText.b3custom(
                text: (isSuccessFull)
                    ? 'Your Order has been placed successfully!'
                    : 'Apologies for the inconvenience. We can\'t confirm your order due to a backend issue. If we can\'t confirm it within 24 hours, we\'ll refund your payment promptly.',
                color: fydTGrey,
                textAlign: TextAlign.center,
              ),
            ),
            //! spacing
            (isSuccessFull)
                ? SizedBox(height: 5.h)
                : SizedBox(
                    height: 40.h,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 10.w),
              child: FydText.b3custom(
                text: (isSuccessFull)
                    ? 'You can track it in your orders.'
                    : 'If you have any further questions or concerns, please do not hesitate to contact us.',
                color: fydLogoBlue,
                weight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        (isSuccessFull)
            //! btn1 (ORDERS)
            ? Padding(
                padding: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
                child: FydBtn(
                  height: 60.h,
                  isFilled: false,
                  color: fydBlueGrey,
                  fydText: const FydText.h3custom(
                    text: 'Go To Orders',
                    weight: FontWeight.w700,
                    color: fydTGrey,
                  ),
                  onPressed: () async {
                    //! Orders Navigation
                    context.navigateNamedTo(Rn.profile);
                  },
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }

//?-----------------------------------------------------------------------------

  _bottomSheetView(BuildContext context, bool isSuccessFull) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! btn (HOME)
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
          child: FydBtn(
            height: 60.h,
            color: fydPGrey,
            fydText: const FydText.h3custom(
              text: 'Take Me Home',
              color: fydBlueGrey,
              weight: FontWeight.w700,
            ),
            onPressed: () async {
              //! Home Navigation
              context.navigateNamedTo(Rn.home);
            },
          ),
        ),
        //! btn (Help)
        (isSuccessFull)
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(bottom: 40.h, left: 15.w, right: 15.w),
                child: FydBtn(
                  height: 60.h,
                  isFilled: false,
                  fillColor: fydPDgrey,
                  color: fydBlueGrey,
                  fydText: const FydText.h3custom(
                    text: 'Go Towards Help',
                    weight: FontWeight.w700,
                    color: fydBlueGrey,
                  ),
                  onPressed: () async {
                    context.navigateNamedTo(Rn.profile);
                  },
                ),
              )
      ],
    );
  }

//?-----------------------------------------------------------------------------
} // ConfirmationPage
//?-----------------------------------------------------------------------------
