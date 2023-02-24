import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    log(context.router.currentUrl);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CartCubit, CartState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/main/cart') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            //! failure
            if (state.failure.isSome()) {
              state.failure.fold(
                () => null,
                (cartFailure) => showSnack(
                    context: context,
                    durationSeconds: 2,
                    viewType: SnackBarViewType.withNav,
                    message: cartFailure.when(
                      itemNotAvailableAnymore: () =>
                          'Few items are out of Stock!',
                      maxItemAvailability: () => 'No more left in stock',
                      maxCartLimit: () => 'Max cart limit reached!',
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
            //! loading overlay
            if (state.updating == true) {
              _loadingOverlay.show(context);
            }
            if (state.updating == false) {
              _loadingOverlay.hide();
            }
          },
          builder: (context, state) {
            //! Loading
            if (state.updating && state.cartRealtime == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydLogoBlue,
                  size: 40.0,
                ),
              );
            }
            //! error state
            else if (state.cartRealtime == null ||
                Helpers.checkEntries(
                        state.cartItemsInTuple3!
                            .map((cartItem) => cartItem.value1)
                            .toList()
                            .cast(),
                        state.cartItemsDetail!.cast()) ==
                    false) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo/oops.png',
                    fit: BoxFit.fitWidth,
                    width: 250,
                  ),
                  const FydText.b1custom(
                    text: 'Ahhh! something went wrong',
                    color: fydBlueGrey,
                    letterSpacing: .8,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 100),
                    child: FydBtn(
                      color: fydPGrey,
                      onPressed: () {
                        context.read<CartCubit>().initializeCart();
                      },
                      height: 50,
                      fydText: const FydText.b1custom(
                        text: 'Refresh cart',
                        color: fydBlueGrey,
                      ),
                    ),
                  )
                ],
              );
            }
            //! Empty cart
            else if (state.cartItemsInTuple3!.isEmpty) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo/empty-cart.png',
                        fit: BoxFit.fitWidth,
                        width: 150,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const FydText.b1custom(
                    text: 'Shop to add items in Cart!',
                    color: fydBlueGrey,
                    letterSpacing: .8,
                  ),
                ],
              );
            }
            //! cart-view
            else {
              double getTopSheetHeight() {
                final cartItems = state.cartItemsInTuple3!.length;
                switch (cartItems) {
                  case 1:
                    return 180.h;
                  case 2:
                    return 280.h;
                  case 3:
                    return 380.h;
                  case 4:
                    return 490.h;

                  default:
                    return 490.h;
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

    return Column(
      children: [
        //! Appbar
        FydAppBar(
          //! heading
          main: const Center(
              child: FydText.d3black(
            text: 'Cart',
            letterSpacing: 1.3,
          )),
          //! edit-btn
          trailing: AppBarBtn(
            iconData: Icons.delete_forever,
            onPressed: () => context.read<CartCubit>().clearCart(),
          ),
        ),
        //! List-View
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: (state.cartItemsInTuple3!.length == 1) ? 10.h : 0,
              left: 10.w,
              right: 10.w,
              bottom: 4.h,
            ),
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
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! store-name
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
                child: FydText.b3custom(
                  text: state.cartRealtime!.storeName,
                  color: fydTGrey,
                  weight: FontWeight.w600,
                ),
              ),
              //! store-id
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: FydText.b3custom(
                  text: state.cartRealtime!.cartId,
                  color: fydTGrey,
                  weight: FontWeight.w600,
                ),
              ),

              //!total-Items
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const FydText.b2custom(
                      text: 'Total Items',
                      color: fydBlueGrey,
                      letterSpacing: .8,
                    ),
                    FydText.b2custom(
                      text:
                          '(${state.cartRealtime!.cartCount.toString().padLeft(2, '0')}) ',
                      weight: FontWeight.w600,
                      color: fydLogoBlue,
                    )
                  ],
                ),
              ),
              const FydDivider(
                color: fydBlueGrey,
              ),
              //!total
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const FydText.b2custom(
                      text: 'Sub-Total',
                      color: fydBlueGrey,
                      letterSpacing: .8,
                    ),
                    Text(
                      '₹ ${subTotal.toInt()}',
                      style: GoogleFonts.exo2(
                        fontWeight: FontWeight.w600,
                        color: fydLogoBlue,
                        fontSize: 20,
                        letterSpacing: .9,
                      ),
                    )
                  ],
                ),
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
            fydText: const FydText.h3custom(
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
                  title: 'Alert!',
                  message:
                      'Product/Products not available. \n remove before proceeding.',
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
        //! available view
        SizedBox(
          height: 90.h,
          width: double.infinity,
          child: Card(
            color: (availability >= qty) ? fydPWhite : Colors.grey[300],
            elevation: 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
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
                        imageUrl: imageLink,
                        onClose: () => Navigator.of(context).pop(true),
                      ),
                    );
                  },
                  child: SizedBox(
                      height: double.infinity,
                      width: 85.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: imageLink,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const SpinKitWave(
                            size: 20,
                            color: fydTGrey,
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            color: fydTGrey,
                            size: 70.h,
                          ),
                        ),
                      )),
                ),
                //! Product-Detail
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 5.w, right: 3.w, bottom: 3.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! Name : price : delete
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
                                //! name
                                FydEllipsisText(
                                  width: MediaQuery.of(context).size.width * .6,
                                  fydText: FydText.b3black(text: prodName),
                                ),

                                //! price
                                FydText.b4custom(
                                  text: '₹ $price',
                                  color: fydLogoBlue,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            //! delete btn
                            InkResponse(
                              onTap: onDeletePressed,
                              radius: 50,
                              child: const Icon(
                                Icons.cancel_outlined,
                                size: 22,
                                color: fydTGrey,
                              ),
                            ),
                          ],
                        ),
                        //! size : incre/decrement : qty
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //! Size
                            Card(
                              color: fydTGrey,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                child: FydText.b3custom(
                                  text: size,
                                  color: fydPWhite,
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //! Editor
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //! Decreament-btn
                                  InkResponse(
                                    onTap: onDecrementPressed,
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                      size: 22,
                                      color: fydTGrey,
                                    ),
                                  ),
                                  //! QTY
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: FydText.b3custom(
                                      text: qty.toString().padLeft(2, '0'),
                                      color: fydPDgrey,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  //! Increament-btn
                                  InkResponse(
                                    onTap: onIncrementPressed,
                                    splashColor: fydLogoBlue,
                                    child: const Icon(
                                      Icons.add_circle_sharp,
                                      size: 22,
                                      color: fydTGrey,
                                    ),
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
        //! not available view
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //! alert Message
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
                    letterSpacing: .9,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//?-----------------------------------------------------------------------------
