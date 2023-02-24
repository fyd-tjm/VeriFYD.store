import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/presentation/core/widgets/fyd_text_ellipsis.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../03 domain/user/00_export_user_domain.dart';

//?-----------------------------------------------------------------------------

class DeliveryAddressWrapperPage extends StatelessWidget {
  const DeliveryAddressWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CheckoutBloc>(),
      child: WillPopScope(
          onWillPop: () async {
            final popResult = await showPermissionDialog(
                context: context,
                title: 'Alert!',
                message: "Leave and discard changes?",
                falseBtnTitle: 'No',
                trueBtnTitle: 'Yes');
            return popResult ?? false;
          },
          child: const DeliveryAddressPage()),
    );
  }
}

//?-----------------------------------------------------------------------------

class DeliveryAddressPage extends HookWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(context.router.currentUrl);
    //------
    // deliveryAddress Tuple(index, address)
    final deliveryAddress = useState<Tuple2<int, FydAddress>?>(null);
    //------
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<CheckoutBloc, CheckoutState>(
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
                      color: fydLogoBlue,
                      size: 30,
                    ),
                  );
                }
                //! DeliveryAddress View
                else {
                  return FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 150.h,
                    topSheet: _topSheetView(context, fydUser, deliveryAddress),
                    bottomSheet: _bottomSheetView(
                        context, fydUser, checkoutState, deliveryAddress),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------

  _topSheetView(
    BuildContext context,
    FydUser fydUser,
    ValueNotifier<Tuple2<int, FydAddress>?> deliveryAddress,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (backBTN + heading)
        FydAppBar(
          //! close-btn
          leading: AppBarBtn(
              iconData: Icons.close_rounded,
              onPressed: () {
                HapticFeedback.lightImpact();
                context.router.pop();
              }),
          //! store name
          main: const Center(
              child: FydText.d3black(
            text: 'Delivery Address',
            size: 27,
          )),
        ),
        //! newAddress-Btn
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
          child: FydBtn(
            height: 50.h,
            color: fydPDgrey,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 25.w,
                    color: (fydUser.addresses.entries.length > 2)
                        ? fydTGrey
                        : fydLogoBlue,
                  ),
                ),
                FydText.b1custom(
                  text: 'add address',
                  color: (fydUser.addresses.entries.length > 2)
                      ? fydTGrey
                      : fydLogoBlue,
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
                showSnack(context: context, message: 'address Limit is 3!');
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

//?-----------------------------------------------------------------------------

  _bottomSheetView(
    BuildContext context,
    FydUser fydUser,
    CheckoutState checkoutState,
    ValueNotifier<Tuple2<int, FydAddress>?> deliveryAddress,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! Delivery-address list view
          (fydUser.addresses.isEmpty)
              ? const Expanded(
                  child: Center(
                    child: FydText.b1custom(
                      text: 'no saved Addresses, \n add new one. ↗️',
                      color: fydBlueGrey,
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                        padding: EdgeInsets.symmetric(vertical: 5.h),
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
                    color: fydPGrey,
                    widget: (checkoutState.isProcessing)
                        ? const Center(
                            child: SpinKitWave(
                            color: fydLogoBlue,
                            size: 25,
                          ))
                        : const FydText.h3custom(
                            text: 'Confirm Address',
                            color: fydLogoBlue,
                            weight: FontWeight.bold,
                          ),
                    onPressed: () async {
                      if (checkoutState.isProcessing) return;
                      //-------
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

//?-----------------------------------------------------------------------------
} // DeliveryAddressPage

//?-----------------------------------------------------------------------------
//! deliveryAddress tile
class DeliveryAddressTile extends StatelessWidget {
  final FydAddress address;
  final int addressIndex;
  final int? selectedIndex;
  final Function(int) onSelect;
  final Function(int) onEditPresses;

  const DeliveryAddressTile({
    required this.addressIndex,
    required this.address,
    required this.selectedIndex,
    required this.onSelect,
    required this.onEditPresses,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FydBtn(
      color: fydPGrey,
      onPressed: () => onSelect(addressIndex),
      height: 130.h,
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            //! (name + phone + radioBtn)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //! name:phone
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! name
                    FydText.b3custom(
                      color: fydPWhite,
                      text: address.name,
                      weight: FontWeight.w600,
                      letterSpacing: .8,
                    ),
                    //! phone
                    FydText.b3custom(
                      color: fydPWhite,
                      text: Helpers.phoneMaskWithCountryCode(address.phone),
                      weight: FontWeight.w600,
                      letterSpacing: .8,
                    ),
                  ],
                ),
                //! radio-Btn
                Radio(
                  value: addressIndex,
                  groupValue: selectedIndex,
                  onChanged: (v) {
                    onSelect(addressIndex);
                  },
                  toggleable: false,
                  fillColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return fydLogoBlue;
                    }
                    return fydBlueGrey;
                  }),
                ),
              ],
            ),
            //! (address + editBtn)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! (al1 + al2)
                    FydTextEllipsis(
                      width: 270.w,
                      fydText: FydText.b3custom(
                        text: "${address.line1}, ${address.line2}",
                        color: fydBlueGrey,
                        weight: FontWeight.w600,
                      ),
                    ),
                    //! (state + pincode)
                    FydTextEllipsis(
                      width: 260.w,
                      fydText: FydText.b3custom(
                        text: '${address.city}, ${address.pincode}',
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                    ),
                  ],
                ),
                //! edit-Btn
                TextButton(
                  onPressed: () => onEditPresses(addressIndex),
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  child: const FydText.b2custom(
                    text: 'Edit',
                    color: fydBlueGrey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
