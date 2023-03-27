import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';

class OrdersTile extends StatelessWidget {
  final FydOrder fydOrder;
  final Function(FydOrder) onPressed;
  const OrdersTile({Key? key, required this.fydOrder, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: InkWell(
        splashColor: fydBblue,
        onTap: () {
          HapticFeedback.mediumImpact();
          onPressed(fydOrder);
        },
        child: Card(
          color: fydSblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //! upper section
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! id: storeName: itemsCount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! orderId
                        FydText.b2custom(
                          text: 'Order-Id: ${fydOrder.orderId}',
                          weight: FontWeight.w600,
                          color: fydBbluegrey,
                        ),
                        //! storeName
                        FydText.b4custom(
                          text: fydOrder.orderInfo.storeName,
                          weight: FontWeight.w600,
                          color: fydPgrey,
                        ),
                        //! itemCount
                        FydText.b4custom(
                          text:
                              '${fydOrder.orderInfo.orderSummary.totalItems} Items',
                          weight: FontWeight.w600,
                          color: fydPgrey,
                        ),
                      ],
                    ),
                    //! date
                    FydText.b4custom(
                      color: fydBbluegrey,
                      text:
                          DateFormat("dd-MM-yyyy").format(fydOrder.orderDate!),
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                //! lower section
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! price
                    FydText.b2white(
                      text: '₹ ${fydOrder.paymentInfo.paymentAmount}',
                      weight: FontWeight.bold,
                      color: fydBbluegrey,
                    ),
                    //! status
                    FydText.b4custom(
                      text: fydOrder.orderStatus.when(
                        failure: (f) => '',
                        success: () => 'Processing',
                        confirmed: () => 'Confirmed',
                        declined: () => 'Declined',
                        shipped: () => 'Shipped',
                        delivered: (date) => 'Delivered',
                        fullFilled: () => 'FullFilled',
                        refunded: (id) => 'Refunded',
                      ),
                      weight: FontWeight.bold,
                      color: fydOrder.orderStatus.when(
                        failure: (f) => Colors.transparent,
                        success: () => fydBgreen,
                        confirmed: () => fydBgreen,
                        declined: () => fydAred,
                        shipped: () => fydAyellow,
                        delivered: (date) => fydAorange,
                        fullFilled: () => fydBbluegrey,
                        refunded: (id) => fydAred.withOpacity(.5),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
