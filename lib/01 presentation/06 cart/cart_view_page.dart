// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/fyd_loading_overlay.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

import '../../02 application/cart/cubit/cart_cubit.dart';
import '../../03 domain/store/product.dart';
import 'widgets/cart_tile.dart';

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<CartCubit, CartState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == Rn.cart) {
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
                  color: fydBblue,
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
                    AssetHelper.something_went_wrong,
                    fit: BoxFit.fitWidth,
                    width: 250.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const FydText.b2custom(
                    text: 'Ahhh! something went wrong',
                    color: fydBbluegrey,
                    letterSpacing: .8,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 100),
                    child: FydBtn(
                      color: fydSblack,
                      onPressed: () {
                        context.read<CartCubit>().initializeCart();
                      },
                      height: 50.h,
                      fydText: const FydText.b1custom(
                        text: 'Refresh cart',
                        color: fydBbluegrey,
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
                        AssetHelper.empty_cart,
                        fit: BoxFit.fitWidth,
                        width: 180.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const FydText.b2custom(
                    text: 'Cart is empty at the moment!',
                    color: fydBbluegrey,
                    letterSpacing: .8,
                    weight: FontWeight.w600,
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
                  topSheet: _TopSheet(context: context, state: state),
                  bottomSheet: _BottomSheet(context: context, state: state));
            }
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final BuildContext context;
  final CartState state;
  const _TopSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
            child: _FydVListView(
                width: double.infinity,
                separation: 0,
                widgetListPadding: null,
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
}

//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final BuildContext context;
  final CartState state;
  const _BottomSheet({
    required this.context,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: fydPgrey,
                  weight: FontWeight.w600,
                ),
              ),
              //! store-id
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: FydText.b3custom(
                  text: state.cartRealtime!.cartId,
                  color: fydPgrey,
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
                      color: fydBbluegrey,
                      letterSpacing: .8,
                    ),
                    FydText.b2custom(
                      text:
                          '(${state.cartRealtime!.cartCount.toString().padLeft(2, '0')}) ',
                      weight: FontWeight.w600,
                      color: fydBblue,
                    )
                  ],
                ),
              ),
              const FydDivider(
                color: fydBbluegrey,
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
                      color: fydBbluegrey,
                      letterSpacing: .8,
                    ),
                    FydText.b1custom(
                      text: '₹ ${subTotal.toInt()}',
                      color: fydBblue,
                      weight: FontWeight.w600,
                      letterSpacing: .9,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //! Proceed-to-checkout BTN
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
          child: FydBtn(
            height: 60.h,
            color: fydSblack,
            fydText: const FydText.h3custom(
              text: 'Proceed To Checkout',
              color: fydBblue,
              weight: FontWeight.bold,
            ),
            onPressed: () async {
              if (state.updating) return;
              //---------
              final availabilityCheck =
                  await context.read<CartCubit>().cartAvailabilityCheck();
              //---------
              if (availabilityCheck == true) {
                // Analytics Logging
                getIt<AnalyticsService>().logProceedToCheckout(
                    storeId: state.cartRealtime!.cartId,
                    subTotal: subTotal,
                    itemCount: state.cartRealtime!.cartCount);
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
}

//?-----------------------------------------------------------------------------

class _FydVListView extends StatelessWidget {
  final double width;
  final double separation;
  final int itemCount;
  final List<Widget> listWidget;
  final EdgeInsets? widgetListPadding;
  const _FydVListView({
    Key? key,
    required this.width,
    required this.separation,
    required this.itemCount,
    required this.listWidget,
    required this.widgetListPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [fydBblue, Colors.transparent, Colors.transparent, fydBblue],
          stops: [0.0, 0.05, 0.95, 1.0],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: SizedBox(
        width: width,
        child: ListView.separated(
          padding: widgetListPadding ??
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemCount,
          itemBuilder: ((context, index) => listWidget[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: separation,
          ),
        ),
      ),
    );
  }
}
