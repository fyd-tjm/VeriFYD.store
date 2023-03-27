import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/03%20domain/user/fyd_user.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import 'widgets/delivery_address_tile.dart';

//?-----------------------------------------------------------------------------

class DeliveryAddressWrapperPage extends StatelessWidget {
  const DeliveryAddressWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final popResult = await showPermissionDialog(
              context: context,
              title: 'Alert!',
              message: "Leave and discard changes?",
              falseBtnTitle: 'No',
              trueBtnTitle: 'Yes');
          return popResult ?? false;
        },
        child: const DeliveryAddressPage());
  }
}

//?-----------------------------------------------------------------------------

class DeliveryAddressPage extends HookWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    //------
    final deliveryAddress = useState<Tuple2<int, FydAddress>?>(null);
    //------
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/checkout/delivery') {
              return true;
            }
            return false;
          },
          listener: (context, checkoutState) {
            // failure and success Handling
            if (checkoutState.failureOrSuccess.isSome()) {
              checkoutState.failureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                  //-------
                  (failure) => failure.when(
                    cartAvailabilityFailure: () =>
                        context.navigateNamedTo(Rn.cart),
                    //-------
                    couponFailure: () {
                      showSnack(
                          context: context,
                          viewType: SnackBarViewType.withNav,
                          message: 'something went wrong!');
                      //-------
                      context.navigateNamedTo(Rn.cart);
                    },
                    paymentFailure: () => null,
                    orderIdFailure: (id) => null,
                    createOrderFailure: (order) => null,
                    //-------
                    unexpectedFailure: (error) {
                      showSnack(
                          context: context,
                          viewType: SnackBarViewType.withNav,
                          message: 'something went wrong!');
                      //-------
                      context.navigateNamedTo(Rn.cart);
                    },
                  ), //-------
                  (success) {
                    context.navigateNamedTo(Rn.payment);
                  },
                ),
              );
            }
          },
          builder: (context, checkoutState) {
            return Builder(
              builder: (context) {
                final fydUser =
                    context.select((FydUserCubit cubit) => cubit.state.fydUser);
                //-------
                //! loading View
                if (fydUser == null ||
                    checkoutState.orderInfo == null ||
                    checkoutState.customerInfo == null) {
                  //-------
                  return const Center(
                    child: SpinKitWave(
                      color: fydBblue,
                      size: 30,
                    ),
                  );
                }
                //! DeliveryAddress View
                else {
                  return FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 160.h,
                    topSheet: _TopSheet(
                        fydUser: fydUser, deliveryAddress: deliveryAddress),
                    bottomSheet: _BottomSheet(
                        fydUser: fydUser,
                        checkoutState: checkoutState,
                        deliveryAddress: deliveryAddress),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final FydUser fydUser;
  final ValueNotifier<Tuple2<int, FydAddress>?> deliveryAddress;

  const _TopSheet({
    required this.fydUser,
    required this.deliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (heading + back-Btn )
        FydAppBar(
          leading: AppBarBtn.close(
            onPressed: () {
              context.router.pop();
            },
          ),
          main: const Center(
            child: FydText.h2black(
              text: 'delivery Address',
              letterSpacing: .9,
            ),
          ),
        ),
        //! newAddress-Btn
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
          child: FydBtn(
            height: 50.h,
            color: fydPblack,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 25.w,
                    color: (fydUser.addresses.entries.length > 2)
                        ? fydPgrey
                        : fydBblue,
                  ),
                ),
                FydText.b1custom(
                  text: 'add address',
                  color: (fydUser.addresses.entries.length > 2)
                      ? fydPgrey
                      : fydBblue,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            //! navigate to  NewAddress-page
            onPressed: () async {
              // reset the delivery address
              deliveryAddress.value = null;
              //-------
              // max 3 addresses
              if (fydUser.addresses.entries.length > 2) {
                showSnack(
                    context: context,
                    snackPosition: SnackBarPosition.bottom,
                    durationSeconds: 3,
                    message: 'address Limit is 3!');
              } //
              else {
                context.router.pushNamed('/newAddress');
              }
            },
          ),
        ),
      ],
    );
  }
}

//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final FydUser fydUser;
  final CheckoutState checkoutState;
  final ValueNotifier<Tuple2<int, FydAddress>?> deliveryAddress;
  const _BottomSheet({
    required this.fydUser,
    required this.checkoutState,
    required this.deliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! Delivery-address list view
          (fydUser.addresses.isEmpty)
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetHelper.no_address_saved,
                      width: 100.w,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 20.h),
                    const FydText.b2custom(
                      text: 'No Address added yet!',
                      weight: FontWeight.w600,
                      color: fydBbluegrey,
                    ),
                  ],
                )
              : ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    fydUser.addresses.length,
                    (index) {
                      final addressMap = fydUser.addresses;
                      final reverseIndex =
                          (fydUser.addresses.entries.length - 1) - index;
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: DeliveryAddressTile(
                          addressIndex: addressMap.keys.elementAt(reverseIndex),
                          selectedIndex: deliveryAddress.value?.value1,
                          address: addressMap.values.elementAt(reverseIndex),
                          onSelect: (index) {
                            //-------
                            HapticFeedback.lightImpact();
                            // select the address
                            deliveryAddress.value = Tuple2(
                              index,
                              addressMap.values.elementAt(reverseIndex),
                            );
                            //-------
                          },
                          onEditPresses: (index) {
                            //-------
                            HapticFeedback.lightImpact();
                            // select the address
                            deliveryAddress.value = Tuple2(
                              index,
                              addressMap.values.elementAt(reverseIndex),
                            );
                            //-------
                            // navigate to edit page
                            context.router.push(
                              UpdateAddressWrapperRoute(
                                existingAddress:
                                    addressMap.values.elementAt(reverseIndex),
                                addressIndex: index,
                              ),
                            );
                            //-------
                          },
                        ),
                      );
                    },
                  ),
                ),
          //------------
          //! confirm-Address-Btn
          (fydUser.addresses.isEmpty)
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: FydBtn(
                    height: 60.h,
                    color: fydSblack,
                    widget: (checkoutState.isProcessing)
                        ? const Center(
                            child: SpinKitWave(
                            color: fydBblue,
                            size: 25,
                          ))
                        : const FydText.h3custom(
                            text: 'Confirm Address',
                            color: fydBblue,
                            weight: FontWeight.w600,
                          ),
                    onPressed: () async {
                      if (checkoutState.isProcessing) return;
                      //-------
                      HapticFeedback.mediumImpact();
                      if (deliveryAddress.value == null) {
                        showSnack(
                            context: context,
                            snackPosition: SnackBarPosition.top,
                            message: 'No Address Selected!');
                      } else {
                        // Add-ShippingInfo Event
                        context.read<CheckoutBloc>().add(
                              AddShippingInfo(
                                shippingAddress: deliveryAddress.value!.value2,
                              ),
                            );
                        //----------
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
