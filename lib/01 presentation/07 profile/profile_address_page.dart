import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/add_address_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/edit_address_page.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

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
      backgroundColor: fydPDgrey,
      body: SafeArea(
          child: FydView(
        pageViewType: ViewType.without_Nav_Bar,
        isScrollable: false,
        topSheetHeight: 150.h,
        topSheet: _topSheetView(
          context,
        ),
        bottomSheet: _bottomSheetView(
          context,
        ),
      )),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context) {
    return Builder(builder: (context) {
      final fydUser =
          context.select((FydUserCubit cubit) => cubit.state.fydUser);
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
                //TODO: back navigation
                onPressed: () {},
              ),
            ),
            main: Center(
              child: FydText.d2black(text: 'Address(es)'),
            ),
          ),
          //! newAddress-Btn
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
            child: FydBtn(
              height: 50.h,
              color: (fydUser == null) ? fydPLgrey : fydPGrey,
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
              //TODO: navigate to Add New Address page
              onPressed: (fydUser == null)
                  ? () {}
                  : () {
                      //max 3 addresses
                      if (fydUser.addresses.entries.length > 2) {
                        showSnack(
                            context: context,
                            snackPosition: SnackBarPosition.bottom,
                            durationSeconds: 3,
                            message: 'address Limit is 3!  edit old one');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddAddressWrapperPage()),
                        );
                      }
                    },
            ),
          ),
        ],
      );
    });
  }

//?-----------------------------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    //! ListView Profile-Address-Tiles
    return Builder(builder: (context) {
      final userAddressMap = context
          .select((FydUserCubit cubit) => cubit.state.fydUser?.addresses);

      return (userAddressMap == null)
          ? const Expanded(
              child: Center(
                child: SpinKitWave(
                  color: fydPWhite,
                  size: 30.0,
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      userAddressMap.entries.length,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: ProfileAddressTile(
                            address: userAddressMap.values.elementAt(
                                (userAddressMap.entries.length - 1) - index),
                            addressIndex: userAddressMap.keys.elementAt(
                                (userAddressMap.entries.length - 1) - index),
                            //TODO: Navigate to updateAddress Screen with index+address
                            onEditPresses: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditAddressWrapperPage(
                                    existingAddress: userAddressMap.values
                                        .elementAt(
                                            (userAddressMap.entries.length -
                                                    1) -
                                                index),
                                    addressIndex: userAddressMap.keys.elementAt(
                                        (userAddressMap.entries.length - 1) -
                                            index),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
    });
  }

//?-----------------------------------------------------------------------------
}
//?-----------------------------------------------------------------------------
