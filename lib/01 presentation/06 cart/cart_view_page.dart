import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_v_h_listview.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import '../../02 application/cart/cubit/cart_cubit.dart';
import '../../03 domain/store/product.dart';

class CartViewWrapperPage extends StatelessWidget {
  const CartViewWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>(),
      child: const CartViewPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class CartViewPage extends StatelessWidget {
  const CartViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final subTotal = useState(0);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        //? cartListener handling
        if (state.failure.isSome()) {
          state.failure.fold(
            () => null,
            (cartFailureOrProductFailure) => cartFailureOrProductFailure.fold(
              (cartFailure) => showSnack(
                context: context,
                message: cartFailure.when(
                  permissionDenied: () => 'permission-denied',
                  notFound: () => 'cart not found',
                  serverError: () => 'server error, try again',
                  unexpectedError: () => 'unexpected error, try again',
                  maxCartLimit: () => 'max Cart limit',
                  maxItemAvailability: () => 'max Item Availability',
                  notAvailableAnymore: () => 'not available anymore',
                ),
              ),
              (productFailure) => showSnack(
                context: context,
                message: productFailure.when(
                  permissionDenied: () => 'permission-denied',
                  notFound: () => 'product not found',
                  serverError: () => 'server error, try again',
                  unexpectedError: () => 'unexpected error, try again',
                ),
              ),
            ),
          );
        }
      },
      builder: ((context, state) {
        if (state.cartRealtime == null || state.productDetails.isEmpty) {
          return const Center(
            child: SpinKitWave(
              color: fydPWhite,
              size: 40.0,
            ),
          );
        } else {
          //----
          //-List-of-Cart-items-(sku:Size:Qty)
          final sizeQtyTuples = <Tuple3>[];
          state.cartRealtime!.cartMap.forEach((sku, value) => value.forEach(
              (size, qty) => sizeQtyTuples.add(Tuple3(sku, size, qty))));
          //----
          // sizeQtyTuples => corresponding details via productDetails
          Product? getProductViaSizeQtyTuples(int index) {
            final sku = sizeQtyTuples.elementAt(index).value1;
            if (state.productDetails[sku] == null) {
              context.read<CartCubit>().getCartProductsDetails();
              return null;
            } else {
              return state.productDetails[sku]!;
            }
          }

          //----
          //-SubTotaling
          var subTotal = 0.0;
          for (var i = 0; i < sizeQtyTuples.length; i++) {
            final qty = sizeQtyTuples.elementAt(i).value3;
            final price = getProductViaSizeQtyTuples(i)?.sellingPrice;
            if (price != null) {
              subTotal += qty * price;
            }
          }
          //-----
          //-qty-availability-check at checkout and updation

          int availabilityBySizeQtyTuple(int index) {
            final qtyFromProductDetails = state
                .productDetails[sizeQtyTuples.elementAt(index).value1]!
                .sizeAvailability[sizeQtyTuples.elementAt(index).value2];
            if (qtyFromProductDetails == null) {
              return 0;
            } else {
              return qtyFromProductDetails;
            }
          }

          bool allItemsAvailableAtCheckout() {
            var checkoutAvailability = 0;
            for (var i = 0; i < sizeQtyTuples.length; i++) {
              if (availabilityBySizeQtyTuple(i) >=
                  sizeQtyTuples.elementAt(i).value3) {
                checkoutAvailability +=
                    sizeQtyTuples.elementAt(i).value3 as int;
              }
            }
            if (checkoutAvailability == state.cartRealtime!.cartCount) {
              return true;
            } else {
              return false;
            }
          }

          //-----

          return FydView(
            pageViewType: ViewType.with_Nav_Bar,
            isScrollable: false,
            topSheetHeight:
                350.h, //TODO: adjust height according to items in cart
            topSheet: _topSheetView(context, state, sizeQtyTuples,
                getProductViaSizeQtyTuples, availabilityBySizeQtyTuple),
            bottomSheet: _bottomSheetView(
                context, state, subTotal.toInt(), allItemsAvailableAtCheckout),
          );
        }
      }),
    );
  }

//?--Top-Sheet-View-------------------------------------------------------------
  _topSheetView(
      BuildContext context,
      CartState state,
      List<Tuple3<dynamic, dynamic, dynamic>> sizeQtyTuples,
      Function(int) getProductViaSizeQtyTuples,
      Function(int) availabilityBySizeQtyTuple) {
    //-----
    var isCartEmpty = sizeQtyTuples.isEmpty;
    //-----
    return Column(
      children: [
        // appbar(heading + deleteBtn)
        FydAppBar(
          // heading
          main: Center(child: FydText.d2black(text: 'Cart')),
          // clear-cart-btn
          trailing: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  primary: fydPDgrey),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Icon(
                  Icons.delete_forever,
                  size: 25.w,
                  color: fydPWhite,
                ),
              ),
              // clearCart onPressed Event
              onPressed: (isCartEmpty == true)
                  ? null
                  : () {
                      context.read<CartCubit>().clearCart();
                    },
            ),
          ),
        ),
        // ScrollView(cart tiles + delete btn + indicator)
        (isCartEmpty == true)
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: FydText.h3custom(
                          text: 'Don\'t like the empty cart,',
                          color: fydDustyPeach),
                    ),
                    Center(
                      child: FydText.h2custom(
                          text: 'add Products!', color: fydDustyPeach),
                    ),
                  ],
                ),
              )
            : Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, left: 10.w, right: 10.w, bottom: 4.h),
                  child: FydVListView(
                      width: double.infinity,
                      separation: 0,
                      itemCount: sizeQtyTuples.length,
                      listWidget: List.generate(
                        sizeQtyTuples.length,
                        (index) => CartTile(
                          prodName: getProductViaSizeQtyTuples(index).name,
                          size: sizeQtyTuples.elementAt(index).value2,
                          price: getProductViaSizeQtyTuples(index).sellingPrice,
                          qty: sizeQtyTuples.elementAt(index).value3,
                          availability: availabilityBySizeQtyTuple(index),
                          company: getProductViaSizeQtyTuples(index).company,
                          imageLink: '', //TODO: add pic
                          onDecrementPressed: () {
                            context.read<CartCubit>().updateQty(
                                  skuId: sizeQtyTuples.elementAt(index).value1,
                                  size: sizeQtyTuples.elementAt(index).value2,
                                  updateBy: -1,
                                );
                          },
                          onIncrementPressed: () {
                            context.read<CartCubit>().updateQty(
                                  skuId: sizeQtyTuples.elementAt(index).value1,
                                  size: sizeQtyTuples.elementAt(index).value2,
                                  updateBy: 1,
                                );
                          },
                        ),
                      )),
                ),
              ),
      ],
    );
  }

//?--Bottom-Sheet-View----------------------------------------------------------
  _bottomSheetView(
    BuildContext context,
    CartState state,
    int subTotal,
    Function allItemsAvailableAtCheckout,
  ) {
    const shippingCost = 100;
    const discount = 50;
    final total = subTotal + shippingCost - discount;
    return Column(
      children: [
        //TODO: Discount-Section
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
          child: SizedBox(
            height: 60.h,
            child: Card(
              color: fydPWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FydText.h2grey(text: 'Discount code'),
                  const Spacer(),
                  FydBtn(
                    fydText: FydText.b2white(text: 'Apply'),
                    onPressed: () {},
                    width: 80.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
            ),
          ),
        ),
        //Billing-Section
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            children: [
              //!subtotal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.b1white(text: 'Sub-Total'),
                  FydText.b1white(
                    text: '+ ₹ $subTotal',
                    weight: FontWeight.w600,
                  )
                ],
              ),
              //!shipping
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.b1white(text: 'Shipping'),
                  FydText.b1white(
                    text: '+ ₹ $shippingCost',
                    weight: FontWeight.w600,
                  )
                ],
              ),
              //!Discount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.b1white(text: 'Discount'),
                  FydText.b1white(
                    text: '- ₹ $discount',
                    weight: FontWeight.w600,
                  )
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
                  FydText.b1white(text: 'Total'),
                  FydText.b1white(
                    text: '₹ $total',
                    weight: FontWeight.w600,
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        //Proceed-to-checkout BTN
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15.w),
          child: FydBtn(
            height: 60.h,
            color: fydPGrey,
            fydText: FydText.h2custom(
              text: 'Proceed To Checkout',
              color: fydSOrange,
            ),
            onPressed: (subTotal == 0)
                ? () {}
                : () {
                    //TODO: call getProductDetails
                    //Todo: empty Cart
                    final result = allItemsAvailableAtCheckout();
                    if (result == true) {
                      //TODO: Procceed Towards Checkout
                    } else {
                      showOkDialog(
                          context: context,
                          message:
                              'Few items in Cart are Not available. \n Remove them before proceeding.');
                    }
                  },
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------

//! cart-tile
class CartTile extends StatelessWidget {
  final String imageLink;
  final String prodName;
  final String company;
  final String size;
  final double price;
  final int qty;
  final int availability;
  final VoidCallback onDecrementPressed;
  final VoidCallback onIncrementPressed;
  const CartTile({
    Key? key,
    required this.prodName,
    required this.company,
    required this.size,
    required this.price,
    required this.qty,
    required this.availability,
    required this.onDecrementPressed,
    required this.onIncrementPressed,
    required this.imageLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //top view
        SizedBox(
          height: 100.h,
          width: double.infinity,
          child: Card(
            color: (availability >= qty) ? fydSPink : Colors.grey[300],
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: (availability >= qty)
                  ? BorderSide.none
                  : const BorderSide(color: fydNotifRed, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //?Product-Image (width:85w)
                SizedBox(
                  height: double.infinity,
                  width: 85.w,
                  child: Card(
                    color: fydSBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    //TODO: add image via link
                  ),
                ),
                //? Product-Detail (remaining)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.h, left: 6.w, right: 6.w, bottom: 4.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //product-Name
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            prodName,
                            style: GoogleFonts.exo2(
                                color: fydPDgrey,
                                fontSize: body16.fontSize,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        //Product company name
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            company,
                            style: GoogleFonts.exo2(
                                color: fydPLgrey,
                                fontSize: body14.fontSize,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Product cost and size
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FydText.h3black(text: '₹ $price'),
                            Card(
                              color: fydSCPink,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                child: FydText.b2custom(
                                    text: size, color: fydSOrange),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //? Qty-Editor (width: 110.w)
                SizedBox(
                  width: 110.w,
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Decreament-btn
                        IconButton(
                          onPressed: onDecrementPressed,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.remove_circle_outline_sharp),
                          color: fydPDgrey,
                          iconSize: 30,
                        ),
                        // QTY
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: FydText.h2black(
                            text: '$qty',
                            weight: FontWeight.w600,
                          ),
                        ),
                        // Increament-btn
                        IconButton(
                          onPressed: onIncrementPressed,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.add_circle_sharp),
                          color: fydPDgrey,
                          iconSize: 30,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
        //bottom view
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // alert Message
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              // width: double.infinity,
              child: FydText.b3custom(
                  text: (availability >= qty)
                      ? ''
                      : '$availability available right now',
                  weight: FontWeight.bold,
                  color: fydNotifRed),
            ),
            // qty's total
            SizedBox(
              width: 110.w,
              child: Center(
                  child: FydText.b2grey(text: '₹ ${(qty * price).ceil()}')),
            ),
          ],
        )
      ],
    );
  }
}

//?-----------------------------------------------------------------------------
