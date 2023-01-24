import 'dart:developer';

import 'package:auto_route/auto_route.dart';
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
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';

import '../../02 application/cart/cubit/cart_cubit.dart';
import '../../03 domain/store/product.dart';

//?-----------------------------------------------------------------------------

class CartViewWrapperPage extends StatelessWidget {
  const CartViewWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>()..initializeCart(),
      child: CartViewPage(),
    );
  }
}

//?-----------------------------------------------------------------------------

class CartViewPage extends StatelessWidget {
  CartViewPage({Key? key}) : super(key: key);

  final FydLoadingOverlay _loadingOverlay = getIt<FydLoadingOverlay>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CartCubit, CartState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == Rn.cart) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            // failure state
            if (state.failure.isSome()) {
              state.failure.fold(
                () => null,
                (cartFailure) => showSnack(
                    context: context,
                    message: cartFailure.when(
                      itemNotAvailableAnymore: () =>
                          'Few items are out of Stock!',
                      maxItemAvailability: () => 'No more left in stock',
                      maxCartLimit: () => 'reached cart limit!',
                      availabilityCheckFailure: () =>
                          'Server Error! Refresh Cart',
                      itemsDetailFailure: () =>
                          'something went wrong! Refresh Cart',
                      updateCartFailure: () => 'Server Error! Refresh Cart',
                      cartStreamFailure: () =>
                          'something went wrong! Refresh Cart',
                      unexpectedError: (error) =>
                          'something went wrong! Refresh Cart',
                    )),
              );
            }
            // loading overlay
            if (state.updating == true) {
              _loadingOverlay.show(context);
            }
            if (state.updating == false) {
              _loadingOverlay.hide();
            }
          },
          // if cartRealTime updated trigger build
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            // Loading in case of cartState null
            if (state.cartRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydLogoBlue,
                  size: 40.0,
                ),
              );
            }
            // Empty cart
            else if (state.cartItemsInTuple3!.isEmpty) {
              return Center(
                child: FydText.h2custom(
                    text: 'Add products To Cart!', color: fydBlueGrey),
              );
            }
            // if product-Detail not exist for sku
            else if (Helpers.checkEntries(
                    state.cartItemsInTuple3!
                        .map((cartItem) => cartItem.value1)
                        .toList()
                        .cast(),
                    state.cartItemsDetail!.cast()) ==
                false) {
              return Center(
                child: Center(
                  child: FydText.h2custom(
                      text: 'something went Wrong, Refresh',
                      color: fydBlueGrey),
                ),
              );
            }
            // cart-view
            else {
              double getTopSheetHeight() {
                final cartItems = state.cartItemsInTuple3!.length;
                switch (cartItems) {
                  case 1:
                    return 200.h;
                  case 2:
                    return 300.h;

                  default:
                    return 350.h;
                }
              }

              //------
              return FydView(
                pageViewType: ViewType.with_Nav_Bar,
                isScrollable: false,
                topSheetHeight: getTopSheetHeight(),
                topSheet: _topSheetView(
                  context: context,
                  state: state,
                ),
                bottomSheet: _bottomSheetView(
                  context: context,
                  state: state,
                ),
              );
            }
          },
        ),
      ),
    );
  }

//?--Top-Sheet-View-------------------------------------------------------------

  _topSheetView({
    required BuildContext context,
    required CartState state,
  }) {
    //-----
    Product getProductForCartItem(Tuple3 cartItem) {
      return state.cartItemsDetail![cartItem.value1]!;
    }

    //-----
    int getProductAvailablilityForCartItem(Tuple3 cartItem) {
      return getProductForCartItem(cartItem).sizeAvailability[cartItem.value2]!;
    }

    // View
    return Column(
      children: [
        //! appbar(heading + deleteBtn)
        FydAppBar(
          // heading
          main: Center(child: FydText.d3black(text: 'Cart')),
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
              onPressed: () => context.read<CartCubit>().clearCart(),
            ),
          ),
        ),
        // ScrollView(cart tiles + delete btn + indicator)
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 10.w, right: 10.w, bottom: 4.h),
            child: FydVListView(
                width: double.infinity,
                separation: 0,
                itemCount: state.cartItemsInTuple3!.length,
                listWidget: List.generate(
                  state.cartItemsInTuple3!.length,
                  (index) => CartTile(
                      prodName:
                          getProductForCartItem(state.cartItemsInTuple3![index])
                              .name,
                      size: state.cartItemsInTuple3![index].value2,
                      price:
                          getProductForCartItem(state.cartItemsInTuple3![index])
                              .sellingPrice,
                      qty: state.cartItemsInTuple3![index].value3,
                      availability: getProductAvailablilityForCartItem(
                          state.cartItemsInTuple3![index]),
                      company:
                          getProductForCartItem(state.cartItemsInTuple3![index])
                              .company,
                      imageLink:
                          getProductForCartItem(state.cartItemsInTuple3![index])
                              .thumbnailImage,
                      onDecrementPressed: () {
                        context.read<CartCubit>().updateQty(
                              cartItem: state.cartItemsInTuple3![index],
                              updateBy: -1,
                            );
                      },
                      onIncrementPressed: () {
                        context.read<CartCubit>().updateQty(
                              cartItem: state.cartItemsInTuple3![index],
                              updateBy: 1,
                            );
                      },
                      onDeletePressed: () {
                        context.read<CartCubit>().removeSize(
                            cartItem: state.cartItemsInTuple3![index],
                            qtyToBeRemoved:
                                state.cartItemsInTuple3![index].value3);
                      }),
                )),
          ),
        ),
      ],
    );
  }

//?--Bottom-Sheet-View----------------------------------------------------------

  _bottomSheetView({
    required BuildContext context,
    required CartState state,
  }) {
    //--------
    //subTotal calculation
    double subTotal = 0;
    for (var cartItem in state.cartItemsInTuple3!) {
      final price = state.cartItemsDetail![cartItem.value1]!.sellingPrice;
      subTotal += price * cartItem.value3;
    }
    //------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: 30.h, bottom: 10.h, left: 20.w, right: 20.w),
          child: Column(
            children: [
              //!total-Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FydText.b1custom(
                    text: 'Total Items',
                    color: fydGreyWhite,
                  ),
                  FydText.b1custom(
                    text: (state.cartRealtime == null)
                        ? '- -'
                        : '(${state.cartRealtime!.cartCount}) ',
                    weight: FontWeight.w600,
                    color: fydBlueGrey,
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
                  FydText.b1custom(
                    text: 'Sub-Total',
                    color: fydGreyWhite,
                  ),
                  Text(
                    ((state.cartRealtime == null))
                        ? '- -'
                        : '₹ ${subTotal.toInt()}',
                    style: GoogleFonts.exo2(
                      fontWeight: FontWeight.w600,
                      color: fydLogoBlue,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        //! Proceed-to-checkout BTN
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15.w),
          child: FydBtn(
            height: 60.h,
            color: fydPGrey,
            fydText: FydText.h2custom(
              text: 'Proceed To Checkout',
              color: fydLogoBlue,
              weight: FontWeight.bold,
            ),
            onPressed: () async {
              if (state.updating) return;
              //---------
              final availabilityCheck =
                  await context.read<CartCubit>().cartAvailabilityCheck();
              //---------
              if (availabilityCheck == true) {
                //Procceed Towards Checkout
                context.router.navigateNamed(Rn.checkout);
              } else {
                showOkDialog(
                  context: context,
                  message: 'Items not available. \n remove before proceeding.',
                );
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
  final VoidCallback onDeletePressed;
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
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //top view
        SizedBox(
          height: 100.h,
          width: double.infinity,
          child: Card(
            color: (availability >= qty) ? fydPWhite : Colors.grey[300],
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: (availability >= qty)
                  ? BorderSide.none
                  : const BorderSide(color: fydNotifRed, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //! Product-Image (width:85w)
                SizedBox(
                  height: double.infinity,
                  width: 85.w,
                  child: Card(
                    color: fydSPink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.network(
                      imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //! Product-Detail
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 4.w, right: 3.w, bottom: 3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name : price : delete
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // name
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Text(
                                    prodName,
                                    style: GoogleFonts.exo2(
                                        color: fydPDgrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // price
                                FydText.b3custom(
                                  text: '₹ $price',
                                  color: fydBlueGrey,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),

                            // delete btn
                            IconButton(
                              onPressed: onDeletePressed,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.cancel_outlined),
                              color: fydBlueGrey,
                              iconSize: 25,
                            ),
                          ],
                        ),
                        // size : incre/decrement : qty
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            ),
                            //Editor
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Decreament-btn
                                  IconButton(
                                    onPressed: onDecrementPressed,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(
                                        Icons.remove_circle_outline_sharp),
                                    color: fydBlueGrey,
                                    iconSize: 25,
                                  ),
                                  // QTY
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: FydText.b1custom(
                                      text: '$qty',
                                      color: fydBlueGrey,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  // Increament-btn
                                  IconButton(
                                    onPressed: onIncrementPressed,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(Icons.add_circle_sharp),
                                    color: fydBlueGrey,
                                    iconSize: 25,
                                  ),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //bottom view
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // alert Message
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              // width: double.infinity,
              child: Text(
                (availability >= qty)
                    ? ''
                    : '$availability available right now',
                style: const TextStyle(
                    color: fydNotifRed,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//?-----------------------------------------------------------------------------


              
              
            
          