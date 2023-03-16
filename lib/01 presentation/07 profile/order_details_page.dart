import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/08%20checkout/widgets/order_summary_section.dart';
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FydView(
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
          leading: AppBarBtn(
              iconData: FontAwesomeIcons.arrowLeftLong,
              iconSize: 20,
              padding: const EdgeInsets.all(8.0),
              onPressed: () {
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
            disabledColor: fydSwhite,
            isActive: (activeIndex >= index),
            isLast: true,
          );
        }
        return TrackerStep(
          enabledColor: activeColor,
          disabledColor: fydSwhite,
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 80.w,
        color: fydSblack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! Product-Image (width:85w)
            GestureDetector(
              onTap: () async {
                //! image-Pop dialog
                await showModal<bool>(
                  context: context,
                  configuration: const FadeScaleTransitionConfiguration(
                    barrierDismissible: true,
                  ),
                  useRootNavigator: false,
                  builder: (context) => FydImageDialog(
                    imageUrl: product.thumbnailImage,
                    onClose: () => Navigator.of(context).pop(true),
                  ),
                );
              },
              child: SizedBox(
                height: double.infinity,
                width: 75.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: product.thumbnailImage,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const SpinKitWave(
                      size: 20,
                      color: fydPgrey,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image_not_supported_outlined,
                      color: fydPgrey,
                      size: 30.h,
                    ),
                  ),
                ),
              ),
            ),
            //! Product-Detail
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! productName: companyName: skuId
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! productName: companyName
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //! productName
                            FydEllipsisText(
                              width: MediaQuery.of(context).size.width * .6,
                              fydText: FydText.b4custom(
                                text: product.name,
                                color: fydPgrey,
                                weight: FontWeight.normal,
                              ),
                            ),
                            //! companyName
                            FydText.b4custom(
                              text: product.company,
                              color: fydBbluegrey,
                              size: 13,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                        //! skuId
                        FydRichText(
                          size: 13,
                          color: fydPgrey,
                          textList: [
                            const TextSpan(text: 'sku: '),
                            TextSpan(
                              text: product.skuId,
                              style: const TextStyle(
                                  color: fydABlueGrey, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //! size : qty X price
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //! Size
                        Card(
                          color: fydPgrey,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: FydText.b3custom(
                              text: size,
                              color: fydPwhite,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //! qty X price
                        FydRichText(
                          size: 15,
                          color: fydBbluegrey,
                          textList: [
                            //! Price
                            TextSpan(text: '₹ ${product.sellingPrice.toInt()}'),
                            //! X
                            const TextSpan(
                                text: '  X  ',
                                style: TextStyle(
                                    color: fydABlueGrey, fontSize: 18)),
                            //! Qty
                            TextSpan(text: qty.toString().padLeft(2, '0'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
