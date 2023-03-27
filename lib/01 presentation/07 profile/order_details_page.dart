import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/widgets/order_summary_section.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';

import 'widgets/order_details_exports.dart';

//?-----------------------------------------------------------------------------
class OrderDetailsWrapperPage extends StatelessWidget {
  const OrderDetailsWrapperPage({super.key, required this.fydOrder});
  final FydOrder fydOrder;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsPage(fydOrder: fydOrder);
  }
}

//?-----------------------------------------------------------------------------
class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.fydOrder});
  final FydOrder fydOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 250.h,
          topSheet: _topSheetView(context),
          bottomSheet: _bottomSheetView(context),
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context) {
    //--------
    final Tuple4<int, String, String, Color> orderStatus = fydOrder.orderStatus.whenOrNull(
        success: () => const Tuple4(
            0, 'Order is Placed Successfully!', 'waiting for Sellers confirmation..', fydBblue),
        confirmed: () => const Tuple4(
            1, 'Order is Confirmed by the Seller!', 'ready to be shipped..', fydBblue),
        declined: () => Tuple4(1, 'Order is Declined by the Seller!',
            'Refund will be initiated within 24Hrs', fydAred.withOpacity(.8)),
        shipped: () => const Tuple4(
            2, 'Order has been shipped!', 'you can Track it here', fydBblue),
        delivered: (date) =>
            const Tuple4(3, 'Order has been Delivered!', 'We hope you enjoy your purchase.', fydBblue),
        fullFilled: () => Tuple4(4, 'Order has been FullFilled!', 'delivered on ${DateFormat("dd-MM-yyyy").format(fydOrder.deliveryDate!)} ', fydBbluegrey),
        refunded: (id) => Tuple4(-1, 'Order Amount has been Refunded!', ' refund Id : $id ', fydBbluegrey))!;
    //--------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (backBTN + heading)
        FydAppBar(
          //! close-btn
          leading: AppBarBtn.back(onPressed: () {
            HapticFeedback.lightImpact();
            context.router.pop();
          }),
          //! Heading-OrderId
          main: Center(
              child: FydRichText(
            size: 24,
            color: fydTBlack,
            textList: [
              const TextSpan(
                  text: 'Order: ',
                  style:
                      TextStyle(color: fydPgrey, fontWeight: FontWeight.w500)),
              TextSpan(text: fydOrder.orderId)
            ],
          )),
        ),
        //! order-Status-section
        Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: Column(
            children: [
              //! status Message
              Padding(
                padding: EdgeInsets.only(bottom: 25.h, left: 15.w, right: 15.w),
                child: SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: Card(
                    color: fydSwhite,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //! title
                        FydText.b2custom(
                          text: orderStatus.value2,
                          color: orderStatus.value4,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        //! message
                        FydText.b3custom(
                          text: orderStatus.value3,
                          color: fydPgrey,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //! status Tracker
              Tracker4(
                activeIndex: orderStatus.value1,
                activeColor: orderStatus.value4,
              ),
            ],
          ),
        )
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    //------- sku: size: qty
    final List<Tuple3<String, String, int>> orderItemsInTuple3 = [];
    fydOrder.orderInfo.orderItems.forEach(
      (sku, sizeQty) => sizeQty.forEach(
        (size, qty) => orderItemsInTuple3.add(Tuple3(sku, size, qty)),
      ),
    );
    //-------
    Product getProductForOrderItem(Tuple3 cartItem) {
      return fydOrder.orderInfo.orderItemsDetail[cartItem.value1]!;
    }

    //-------
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              fydBblue,
              Colors.transparent,
              Colors.transparent,
              fydBblue
            ],
            stops: [0.0, 0.04, 0.96, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: Column(
          children: [
            //! storeInfo: Date: time
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 10.w, right: 10.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! storeInfo
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! storeId
                      FydText.b2custom(
                        text: 'store-Id: ${fydOrder.orderInfo.storeId}',
                        weight: FontWeight.w600,
                        color: fydBbluegrey,
                      ),
                      //! storeName
                      FydText.b4white(
                        text: fydOrder.orderInfo.storeName,
                        weight: FontWeight.w600,
                        color: fydSgrey,
                      ),
                    ],
                  ),
                  //! date/time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! date
                      FydText.b4custom(
                        color: fydPgrey,
                        text: DateFormat("dd-MM-yyyy")
                            .format(fydOrder.orderDate!),
                        weight: FontWeight.bold,
                      ),
                      //! time
                      FydText.b4custom(
                        color: fydPgrey,
                        size: 12,
                        text:
                            "${fydOrder.orderDate!.hour}:${fydOrder.orderDate!.minute}",
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //! Divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FydDivider(
                color: fydBbluegrey,
              ),
            ),
            //! paymentInfo-Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: PaymentInfoSection(
                paymentMode: fydOrder.paymentInfo.paymentMode,
              ),
            ),
            //! Divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FydDivider(
                color: fydBbluegrey,
              ),
            ),
            //! OrderItems-Tiles list
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(orderItemsInTuple3.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: OrderItemTile(
                      product:
                          getProductForOrderItem(orderItemsInTuple3[index]),
                      sku: orderItemsInTuple3[index].value1,
                      size: orderItemsInTuple3[index].value2,
                      qty: orderItemsInTuple3[index].value3,
                    ),
                  );
                }),
              ),
            ),
            //! Divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: FydDivider(
                color: fydBbluegrey,
              ),
            ),
            //! OrderSummary-Section
            OrderSummarySection(
              totalItems: fydOrder.orderInfo.orderSummary.totalItems,
              subTotal: fydOrder.orderInfo.orderSummary.subTotal,
              shipping: fydOrder.orderInfo.orderSummary.shippingCost!,
              discountCoupon: fydOrder.orderInfo.orderSummary.discount,
              total: fydOrder.orderInfo.orderSummary.total!,
            ),
            //! divider
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FydDivider(
                color: fydBbluegrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}

//?-----------------------------------------------------------------------------
//! payment-Info-Section
class PaymentInfoSection extends StatelessWidget {
  const PaymentInfoSection({
    Key? key,
    required this.paymentMode,
  }) : super(key: key);
  final PaymentMode paymentMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! paymentMode
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FydText.b3custom(
              color: fydPgrey,
              text: 'Payment Mode:',
              weight: FontWeight.bold,
            ),
            FydText.b2custom(
              text: paymentMode.when(
                online: (id) => 'online',
                payOnDelivery: () => 'Pay On Delivery',
              ),
              color: fydBbluegrey,
            ),
          ],
        ),
        //! paymentStatus
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FydText.b3custom(
              color: fydPgrey,
              text: paymentMode.when(
                  online: (id) => 'Payment Id:', payOnDelivery: () => ''),
              weight: FontWeight.bold,
            ),
            FydText.b4custom(
              text: paymentMode.when(
                  online: (id) => id!, payOnDelivery: () => ''),
              color: fydBblue,
              weight: FontWeight.bold,
              letterSpacing: .8,
              isSelectable: true,
              isScalable: false,
            ),
          ],
        ),
      ],
    );
  }
} //ordersPage


