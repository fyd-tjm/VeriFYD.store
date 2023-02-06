import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/payment_page.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/checkout/payment_info.dart';
import 'package:verifyd_store/03%20domain/store/product.dart';
import 'package:intl/intl.dart';

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
      body: SafeArea(
          child: FydView(
        pageViewType: ViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 250.h,
        topSheet: _topSheetView(context),
        bottomSheet: _bottomSheetView(context),
      )),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context) {
    //--------
    final Tuple4<int, String, String, Color> orderStatus = fydOrder.orderStatus.whenOrNull(
        success: () => const Tuple4(0, 'Order is Placed Successfully!',
            'waiting for Sellers confirmation..', fydLogoBlue),
        confirmed: () => const Tuple4(
            1, 'Order is Confirmed by the Seller!', 'ready to be shipped..', fydLogoBlue),
        declined: () => Tuple4(
            1,
            'Order is Declined by the Seller!',
            'Refund will be initiated within 24Hrs',
            fydNotifRed.withOpacity(.8)),
        shipped: () => const Tuple4(
            2, 'Order has been shipped!', 'you can Track it here', fydLogoBlue),
        delivered: (date) => const Tuple4(3, 'Order has been Delivered!', 'We hope you enjoy your purchase.', fydLogoBlue),
        fullFilled: () => Tuple4(4, 'Order has been FullFilled!', 'delivered on ${DateFormat("dd-MM-yyyy").format(fydOrder.deliveryDate!)} ', fydBlueGrey),
        refunded: (id) => Tuple4(-1, 'Order Amount has been Refunded!', ' refund Id : $id ', fydBlueGrey))!;
    //--------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (heading + close-Btn )
        FydAppBar(
          leading: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  primary: fydPDgrey),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Icon(
                  Icons.close_rounded,
                  size: 25.w,
                  color: fydPWhite,
                ),
              ),
              //! close navigation
              onPressed: () {
                context.router.pop();
              },
            ),
          ),
          main: Center(
            child: FydText.h2black(
              text: 'Order: ${fydOrder.orderId}',
              weight: FontWeight.bold,
            ),
          ),
        ),
        //! order-Status-section
        Padding(
          padding: EdgeInsets.only(bottom: 25.h, left: 0),
          child: Column(
            children: [
              // status Message
              Padding(
                padding: EdgeInsets.only(bottom: 25.h, left: 15.w, right: 15.w),
                child: SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: Card(
                    color: fydGreyWhite,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FydText.b1custom(
                          text: orderStatus.value2,
                          color: orderStatus.value4,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        FydText.b3custom(
                          text: orderStatus.value3,
                          color: fydPLgrey,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // status Tracker
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
      child: Column(
        children: [
          //! storeName: storeId: Date: time
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 10.w, right: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //storeId
                    FydText.b1custom(
                      text: 'StoreId: ${fydOrder.orderInfo.storeId}',
                      weight: FontWeight.w600,
                      color: fydBlueGrey,
                    ),
                    //storeName
                    FydText.b2white(
                      text: fydOrder.orderInfo.storeName,
                      weight: FontWeight.w600,
                      color: fydPLgrey,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //date
                    FydText.b3custom(
                      color: fydTGrey,
                      text:
                          DateFormat("dd-MM-yyyy").format(fydOrder.orderDate!),
                      weight: FontWeight.bold,
                    ),
                    //time
                    FydText.b3custom(
                      color: fydTGrey,
                      text:
                          "${fydOrder.orderDate!.hour}:${fydOrder.orderDate!.minute}",
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //! divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FydDivider(
              color: fydBlueGrey,
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
              color: fydBlueGrey,
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: OrderItemTile(
                    product: getProductForOrderItem(orderItemsInTuple3[index]),
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
              color: fydBlueGrey,
            ),
          ),
          //! OrderSummary-Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            child: OrderSummarySection(
              totalItems: fydOrder.orderInfo.orderSummary.totalItems,
              subTotal: fydOrder.orderInfo.orderSummary.subTotal,
              shipping: fydOrder.orderInfo.orderSummary.shippingCost!,
              discount: fydOrder.orderInfo.orderSummary.discount,
              total: fydOrder.orderInfo.orderSummary.total!,
            ),
          ),
          //divider
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FydDivider(
              color: fydBlueGrey,
            ),
          ),
        ],
      ),
    );
  }
//?-----------------------------------------------------------------------------
}

//?-----------------------------------------------------------------------------
//! Tracker-4-steps
class Tracker4 extends StatelessWidget {
  const Tracker4({
    Key? key,
    required this.activeIndex,
    required this.activeColor,
  }) : super(key: key);
  final int activeIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(4, (index) {
        if (index == 3) {
          return TrackerStep(
            enabledColor: activeColor,
            disabledColor: fydGreyWhite,
            isActive: (activeIndex >= index),
            isLast: true,
          );
        }
        return TrackerStep(
          enabledColor: activeColor,
          disabledColor: fydGreyWhite,
          isActive: (activeIndex >= index),
        );
      }),
    );
  }
}

class TrackerStep extends StatelessWidget {
  final Color enabledColor;
  final Color disabledColor;
  final bool isLast;
  final bool isActive;
  const TrackerStep({
    Key? key,
    this.isLast = false,
    required this.enabledColor,
    required this.disabledColor,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: (isActive) ? enabledColor : disabledColor,
          radius: 12.r,
        ),
        (!isLast)
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (isActive) ? enabledColor : disabledColor,
                      Colors.white
                    ],
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                  ),
                ),
                height: 1.0,
                width: 70,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
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
        //paymentMode
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FydText.b2custom(
              color: fydTGrey,
              text: 'Payment Mode:',
              weight: FontWeight.bold,
            ),
            FydText.b2custom(
              text: paymentMode.when(
                online: (id) => 'online',
                payOnDelivery: () => 'Pay On Delivery',
              ),
              color: fydBlueGrey,
            ),
          ],
        ),
        //paymentStatus
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FydText.b2custom(
              color: fydTGrey,
              text: paymentMode.when(
                  online: (id) => 'Payment Id:', payOnDelivery: () => ''),
              weight: FontWeight.bold,
            ),
            FydText.b2custom(
              text: paymentMode.when(
                  online: (id) => id!, payOnDelivery: () => ''),
              color: fydBlueGrey,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
} //ordersPage

//?-----------------------------------------------------------------------------
//! Order-Item-Tile
class OrderItemTile extends StatelessWidget {
  final Product product;
  final String sku;
  final int qty;
  final String size;
  const OrderItemTile({
    Key? key,
    required this.product,
    required this.sku,
    required this.size,
    required this.qty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.w,
      color: fydPGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          //! Product-Image (width:85w)
          SizedBox(
            height: 90.w,
            width: 90.w,
            child: Card(
              color: fydSPink,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r)),
              child: Image.network(product.thumbnailImage),
            ),
          ),
          //! Product-Detail
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // productName: companyName: Size
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // productName
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .40,
                            child: Text(
                              product.name,
                              style: GoogleFonts.exo2(
                                  color: fydBlueGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // companyName
                          FydText.b4custom(
                            text: product.company,
                            color: fydBlueGrey,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      // Size
                      Card(
                        color: fydBlueGrey,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: FydText.b2custom(
                            text: size,
                            color: fydPWhite,
                            weight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  // qty X price
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //skuId
                        Row(
                          children: [
                            FydText.b3custom(
                              text: 'sku: ',
                              color: fydBlueGrey,
                              weight: FontWeight.bold,
                            ),
                            FydText.b3custom(
                              text: sku,
                              color: fydSCBlueGrey,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            //price
                            FydText.b3custom(
                              text: '₹ ${product.sellingPrice.toString()}',
                              color: fydBlueGrey,
                              weight: FontWeight.bold,
                            ),
                            FydText.h3custom(
                              text: '  X  ',
                              color: fydSCBlueGrey,
                              weight: FontWeight.bold,
                            ),
                            //qty
                            FydText.b3custom(
                              text: qty.toString().padLeft(2, '0'),
                              color: fydBlueGrey,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
