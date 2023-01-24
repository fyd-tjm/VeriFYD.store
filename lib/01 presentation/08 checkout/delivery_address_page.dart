import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
    //------
    // deliveryAddress Tuple(index, address)
    final deliveryAddress = useState<Tuple2<int, FydAddress>?>(null);
    //------
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listenWhen: (previous, current) {
        // weather on current route or not
        return context.router.isPathActive(Rn.delivery);
      },
      listener: (context, checkoutState) {
        // failure and success Handling
        if (checkoutState.failureOrSuccess.isSome()) {
          checkoutState.failureOrSuccess.fold(
            () => null,
            (failureOrSuccess) => failureOrSuccess.fold(
              //-------
              (failure) => failure.when(
                cartAvailabilityFailure: () => context.navigateNamedTo(Rn.cart),
                //-------
                paymentFailure: () => null,
                orderIdFailure: (id) => null,
                createOrderFailure: (order) => null,
                //-------
                unexpectedFailure: (error) {
                  showSnack(context: context, message: 'something went wrong!');
                  //-------
                  context.navigateNamedTo(Rn.home);
                },
              ), //-------
              (success) {
                context.navigateNamedTo(Rn.payment);
              },
            ),
          );
        }
      },
      buildWhen: (previous, current) {
        // check wheather page in view Port
        return context.router.isPathActive('delivery');
      },
      builder: (context, checkoutState) {
        // Listen to FydUser-Address
        return Builder(
          builder: (context) {
            final fydUser =
                context.select((FydUserCubit cubit) => cubit.state.fydUser);
            //-------
            if (fydUser == null ||
                checkoutState.orderInfo == null ||
                checkoutState.customerInfo == null) {
              //-------
              //! loading View
              return const Scaffold(
                body: SafeArea(
                  child: Center(
                    child: SpinKitWave(
                      color: fydPWhite,
                      size: 30,
                    ),
                  ),
                ),
              );
            } else {
              //! DeliveryAddress View
              return Scaffold(
                body: SafeArea(
                  child: FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 150.h,
                    topSheet: _topSheetView(context, fydUser, deliveryAddress),
                    bottomSheet: _bottomSheetView(
                        context, fydUser, checkoutState, deliveryAddress),
                  ),
                ),
              );
            }
          },
        );
      },
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
            child: FydText.h1black(
              text: 'Delivery Address',
              weight: FontWeight.bold,
            ),
          ),
        ),
        //! newAddress-Btn
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
          child: FydBtn(
            height: 50.h,
            color: fydPGrey,
            widget: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.add_circle_outline_sharp,
                      size: 25.w,
                      color: fydBlueGrey,
                    ),
                  ),
                  FydText.h3custom(
                    text: 'Add New Address',
                    color: fydBlueGrey,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            //! navigate to  NewAddress-page
            onPressed: () {
              //-------
              // reset the delivery address
              deliveryAddress.value = null;
              //-------
              // max 3 addresses
              if (fydUser.addresses.entries.length > 2) {
                showSnack(
                    context: context,
                    snackPosition: SnackBarPosition.bottom,
                    durationSeconds: 3,
                    message: 'address Limit is 3!  edit old one');
              }
              //-------
              // navigate to add-address page
              else {
                context.router.pushNamed(Rn.newAddress);
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
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! Delivery-address list view
          (fydUser.addresses.isEmpty)
              ? Expanded(
                  child: Center(
                    child: FydText.h2custom(
                      text: 'no saved Addresses, \n add new one.',
                      color: fydDustyPeach,
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
          //! Select-Address-Btn
          Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: FydBtn(
              height: 60.h,
              color: fydPGrey,
              widget: (checkoutState.isProcessing)
                  ? const Center(
                      child: SpinKitWave(
                      color: fydLogoBlue,
                      size: 25,
                    ))
                  : FydText.h2custom(
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
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Card(
        color: fydPGrey,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
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
                  // name:phone
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FydText.b1custom(
                        text: address.name,
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                      FydText.b1custom(
                        text: Helpers.phoneMaskWithCountryCode(address.phone),
                        weight: FontWeight.w600,
                        color: fydBlueGrey,
                      ),
                    ],
                  ),
                  // radio-Btn
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
                      // (al1 + al2)
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text: "${address.line1}, ${address.line2}",
                          weight: FontWeight.w600,
                        ),
                      ),
                      // (state + pincode)
                      FydTextEllipsis(
                        width: 260.w,
                        fydText: FydText.b3white(
                          text: '${address.city}, ${address.pincode}',
                          weight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // edit-Btn
                  TextButton(
                    onPressed: () => onEditPresses(addressIndex),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: FydText.b2custom(
                      text: 'Edit',
                      weight: FontWeight.bold,
                      color: fydBlueGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------
