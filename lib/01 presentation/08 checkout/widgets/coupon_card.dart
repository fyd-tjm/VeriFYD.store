//! coupon Card
import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/store/coupon.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    Key? key,
    required this.coupon,
    required this.isEnabled,
    required this.onApply,
  }) : super(key: key);
  final Coupon coupon;
  final bool isEnabled;
  final Function(Coupon) onApply;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: fydSgrey.withOpacity(.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 15,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Heading(message) : code
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Heading(message)
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                  child: Container(
                    color: isEnabled ? fydBblue : fydPgrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: FydText.b1custom(
                        text: coupon.message.toUpperCase(),
                        color: fydPwhite,
                        letterSpacing: .9,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              //! code
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FydText.b4custom(
                  text: coupon.code.toUpperCase(),
                  size: 12,
                  color: fydPwhite,
                  letterSpacing: .9,
                  weight: FontWeight.bold,
                  isScalable: false,
                ),
              )
            ],
          ),

          //! T&C : apply btn
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! T&C (message)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: FydText.b4custom(
                    size: 13,
                    text: coupon.termsAndCondition,
                    color: fydPwhite,
                    weight: FontWeight.normal,
                    isScalable: false,
                  ),
                ),
              ),
              //! apply btn
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: isEnabled ? () => onApply(coupon) : null,
                  child: FydText.b2custom(
                    text: 'Apply',
                    color: isEnabled ? fydBblue : fydPgrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
