import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/edit_profile_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/help_page.dart';
import 'package:verifyd_store/01%20presentation/07%20profile/profile_address_page.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';

import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------

class ProfileViewWrapperPage extends StatelessWidget {
  const ProfileViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>()..getFydUserRealtime(),
      child: const ProfileViewPage(),
    );
  }
}
//?-----------------------------------------------------------------------------

class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FydUserCubit, FydUserState>(
      listener: (context, state) {
        //! listener Handler
        if (state.failureOrSuccess.isSome()) {
          // state.failure.fold(
          //   () => null,
          //   (userFailure) => showSnack(
          //     context: context,
          //     message: userFailure.when(
          //       aborted: () => 'Failed! try again later',
          //       invalidArgument: () => 'Invalid Argument. try again',
          //       alreadyExists: () => 'Data already Exists',
          //       notFound: () => 'Data not found!',
          //       permissionDenied: () => 'Permission Denied',
          //       serverError: () => 'Server Error. try again later',
          //       unknownError: () => 'Something went wrong. try again later',
          //     ),
          //   ),
          // );
        }
      },
      child: FydView(
        pageViewType: ViewType.with_Nav_Bar,
        isScrollable: true,
        topSheetHeight: 300.h,
        topSheet: _topSheetView(context),
        bottomSheet: _bottomSheetView(context),
      ),
    );
  }
//?-Top-Sheet-View--------------------------------------------------------------

  _topSheetView(BuildContext context) {
    return Builder(builder: (context) {
      final fydUser =
          context.select((FydUserCubit cubit) => cubit.state.fydUser);
      return Column(
        children: [
          //! appbar(heading + editBtn)
          FydAppBar(
            // heading
            main: Center(child: FydText.d2black(text: 'Profile')),
            // edit-btn
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
                    Icons.mode_edit_outlined,
                    size: 25.w,
                    color: fydPWhite,
                  ),
                ),
                // clearCart onPressed Event
                onPressed: (fydUser == null)
                    ? null
                    : () {
                        //TODO: EditScreen navigation
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EditProfileWrapperPage()),
                        );
                      },
              ),
            ),
          ),
          // Profile-Logo
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.h,
                  child: Card(
                    color: fydPDgrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: fydDustyPeach,
                      size: 90.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //! Profile-info
          (fydUser == null)
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      SpinKitWave(
                        color: fydPDgrey,
                        size: 30.0,
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Profile-Name
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, bottom: 4.h),
                        child: FydText.h3grey(text: fydUser.name),
                      ),

                      // Profile-Phone
                      FydText.h2black(
                        text: Helpers.phoneMaskWithCountryCode(fydUser.phone),
                        weight: FontWeight.w700,
                      ),

                      // Profile-email
                      (fydUser.email.isEmpty)
                          ? FydText.b1grey(text: 'user@email.com')
                          : FydText.b1grey(text: fydUser.email),
                    ],
                  ),
                ),
        ],
      );
    });
  }

//?-Bottom-Sheet-View-----------------------------------------------------------
  _bottomSheetView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //!Orders
          ProfileTile(
            iconColor: fydSBlue,
            title: 'Orders',
            description: 'your order history',
            iconAsset: 'assets/icons/orders.svg',
            onPressed: () {},
          ),
          SizedBox(
            height: 30.h,
          ),
          //!Address(es)
          ProfileTile(
            iconColor: fydSYellow,
            title: 'Address(es)',
            description: 'manage your addresses',
            iconAsset: 'assets/icons/address.svg',
            onPressed: () {
              //TODO: AddressScreen navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileAddressesWrapperPage()),
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          //!Help
          ProfileTile(
            iconColor: fydSPink,
            title: 'Help',
            description: 'wants to speak with us',
            iconAsset: 'assets/icons/help.svg',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HelpWrapperPage()),
              );
            },
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------

}
