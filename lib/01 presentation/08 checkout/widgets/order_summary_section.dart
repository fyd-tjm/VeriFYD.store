import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    Key? key,
    required this.totalItems,
    required this.subTotal,
    required this.shipping,
    required this.discountCoupon,
    required this.total,
  }) : super(key: key);
  final int totalItems;
  final double subTotal;
  final double shipping;
  final Coupon? discountCoupon;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //!subtotal
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FydText.b3custom(
                text:
                    'subTotal   (${totalItems.toString().padLeft(2, '0')} items)',
                color: fydTGrey,
                weight: FontWeight.w700,
                letterSpacing: .75,
              ),
              FydText.b2custom(
                text: '+ $subTotal',
                color: fydBlueGrey,
                letterSpacing: .8,
              )
            ],
          ),
        ),
        //!shipping
        Padding(
          padding: EdgeInsets.only(bottom: 5.h, left: 10.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const FydText.b3custom(
                text: 'Shipping',
                color: fydTGrey,
                weight: FontWeight.w700,
                letterSpacing: .75,
              ),
              FydText.b2custom(
                text: '+ $shipping',
                color: fydBlueGrey,
                letterSpacing: .8,
              ),
            ],
          ),
        ),
        //!Discount
        (discountCoupon == null)
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(bottom: 5.h, left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FydText.b3custom(
                      text: 'Discount  (${discountCoupon!.code})',
                      color: fydTGrey,
                      weight: FontWeight.w700,
                      letterSpacing: .75,
                    ),
                    FydText.b2custom(
                      text: '-  ${discountCoupon!.value}',
                      color: fydBlueGrey,
                      letterSpacing: .8,
                    ),
                  ],
                ),
              ),
        //! divider
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: const FydDivider(
            color: fydBlueGrey,
          ),
        ),
        //!total
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const FydText.b2custom(
                text: 'Total',
                color: fydPWhite,
                weight: FontWeight.bold,
              ),
              FydText.b1custom(
                text: '₹ $total',
                color: fydLogoBlue,
                letterSpacing: .9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
