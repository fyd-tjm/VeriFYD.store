import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import '../../02 application/fyd user/fyd_user_cubit.dart';
import '../00 core/widgets/00_core_widgets_export.dart';
import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------
class ProfileAddressesWrapperPage extends StatelessWidget {
  const ProfileAddressesWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: const ProfileAddressesPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class ProfileAddressesPage extends StatelessWidget {
  const ProfileAddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<FydUserCubit, FydUserState>(
        listenWhen: (previous, current) {
          return true;
        },
        listener: (context, state) {
          if (state.fydUser == null) {
            context.router.pop();
          }
          if (state.failureOrSuccess.isSome()) {
            state.failureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                      (failure) => null,
                      (success) => null,
                    ));
          }
        },
        buildWhen: (previous, current) {
          if (previous.fydUser?.addresses != current.fydUser?.addresses) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state.fydUser == null) {
            return const Center(
              child: SpinKitWave(
                color: fydPWhite,
                size: 30.0,
              ),
            );
          } else {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 150.h,
              topSheet: _topSheetView(context, state),
              bottomSheet: _bottomSheetView(context, state),
            );
          }
        },
      )),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context, FydUserState state) {
    final fydUser = state.fydUser!;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (heading + back-Btn )
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
                  Icons.arrow_back_ios_new_rounded,
                  size: 25.w,
                  color: fydPWhite,
                ),
              ),
              //! back navigation
              onPressed: () {
                context.router.pop();
              },
            ),
          ),
          main: Center(
            child: FydText.d3black(text: 'Address(es)'),
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
                    ),
                  ),
                  FydText.h3white(text: 'Add New Address'),
                ],
              ),
            ),
            //! navigate to  NewAddress-page
            onPressed: () {
              //max 3 addresses
              if (fydUser.addresses.entries.length > 2) {
                showSnack(
                    context: context,
                    snackPosition: SnackBarPosition.bottom,
                    durationSeconds: 3,
                    message: 'address Limit is 3!  edit old one');
              } else {
                context.navigateNamedTo(Rn.newAddress);
              }
            },
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheetView(BuildContext context, FydUserState state) {
    //! ListView Profile-Address-Tiles
    final userAddressMap = state.fydUser!.addresses;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              userAddressMap.entries.length,
              (index) {
                final reverseIndex =
                    (userAddressMap.entries.length - 1) - index;
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ProfileAddressTile(
                    address: userAddressMap.values.elementAt(reverseIndex),
                    addressIndex: userAddressMap.keys.elementAt(reverseIndex),
                    //! Navigate to updateAddress Screen
                    onEditPresses: (addressIndex) {
                      context.navigateTo(UpdateAddressWrapperRoute(
                        existingAddress:
                            userAddressMap.values.elementAt(reverseIndex),
                        addressIndex: addressIndex,
                      ));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------
