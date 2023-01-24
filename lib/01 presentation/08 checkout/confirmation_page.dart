import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/aa%20mock/static_ui.dart';
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
    return Scaffold(
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 500.h,
          topSheet: _topSheetView(context, isSuccessFull!),
          bottomSheet: _bottomSheetView(context),
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
        //!  (appBar : gif : message)
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: FydAppBar(
                //! heading
                main: Center(
                  child: FydText.d3custom(
                    text:
                        (isSuccessFull) ? 'Order Placed!' : 'Order Not Placed!',
                    color: fydBlueGrey,
                  ),
                ),
              ),
            ),
            //! gif
            Image.network(MockUi.confirmGif,
                height: 220.h,
                fit: BoxFit.contain,
                scale: 1,
                repeat: ImageRepeat.noRepeat),
            SizedBox(
              height: 15.h,
            ),
            //! message section
            FydText.h1black(
              text: 'Order Placed!',
              weight: FontWeight.w700,
              color: fydPWhite,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Your order request has been placed successfully.',
              style: GoogleFonts.exo2(
                color: fydBlueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'You can track it in your orders.',
              style: GoogleFonts.exo2(
                color: fydLogoBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),

        //! btn1
        Padding(
          padding: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
          child: FydBtn(
            height: 60.h,
            isFilled: false,
            color: fydBlueGrey,
            fydText: FydText.h2custom(
              text: 'Go To Orders',
              weight: FontWeight.w700,
              color: fydBlueGrey,
            ),
            onPressed: () async {
              //! Orders Navigation
              context.navigateNamedTo(Rn.profile);
            },
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------

  _bottomSheetView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //! take me home btn
        Padding(
          padding: EdgeInsets.only(top: 30.h, left: 15.w, right: 15.w),
          child: FydBtn(
            height: 60.h,
            // isFilled: false,
            color: fydPGrey,
            fydText: FydText.h2custom(
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
      ],
    );
  }

//?-----------------------------------------------------------------------------
} // ConfirmationPage
//?-----------------------------------------------------------------------------
