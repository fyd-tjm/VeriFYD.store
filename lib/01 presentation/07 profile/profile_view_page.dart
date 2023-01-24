import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/router.dart';

import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------

class ProfileViewWrapperPage extends StatelessWidget {
  const ProfileViewWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: const ProfileViewPage(),
    );
  }
}
//?-----------------------------------------------------------------------------

class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<FydUserCubit, FydUserState>(
        listenWhen: (previous, current) {
          if (context.tabsRouter.activeIndex == 3) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          //! listener Handler
          if (state.failureOrSuccess.isSome()) {
            state.failureOrSuccess.fold(
              () => null,
              (userFailure) => userFailure.fold(
                (failure) => showSnack(
                  context: context,
                  message: failure.when(
                    aborted: () => 'Failed! try again later',
                    invalidArgument: () => 'Invalid Argument. try again',
                    alreadyExists: () => 'Data already Exists',
                    notFound: () => 'Data not found!',
                    permissionDenied: () => 'Permission Denied',
                    serverError: () => 'Server Error. try again later',
                    unknownError: () => 'Something went wrong. try again later',
                  ),
                ),
                (success) => showSnack(context: context, message: 'success!'),
              ),
            );
          }
        },
        buildWhen: (previous, current) {
          return true;
        },
        builder: (context, state) {
          return FydView(
            pageViewType: ViewType.with_Nav_Bar,
            isScrollable: true,
            topSheetHeight: 300.h,
            topSheet: _topSheetView(context, state),
            bottomSheet: _bottomSheetView(context, state),
          );
        },
      ),
    );
  }
//?-Top-Sheet-View--------------------------------------------------------------

  _topSheetView(BuildContext context, FydUserState state) {
    final fydUser = state.fydUser;
    return Column(
      children: [
        //! appbar(heading + editBtn)
        FydAppBar(
          // heading
          main: Center(child: FydText.d3black(text: 'Profile')),
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

              onPressed: (fydUser == null)
                  ? null
                  : () {
                      //! EditProfile Page navigation
                      context.router.navigateNamed(Rn.editProfile);
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
                    color: fydBlueGrey,
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
  }

//?-Bottom-Sheet-View-----------------------------------------------------------
  _bottomSheetView(BuildContext context, FydUserState state) {
    final fydUser = state.fydUser;
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h, bottom: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //!Orders
              ProfileTile(
                iconColor: fydSBlue,
                title: 'Orders',
                description: 'your order history',
                iconAsset: 'assets/icons/orders.svg',
                onPressed: (fydUser == null)
                    ? () {}
                    : () {
                        context.navigateNamedTo(Rn.orders);
                      },
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
                onPressed: (fydUser == null)
                    ? () {}
                    : () {
                        //! AddressScreen navigation
                        context.navigateNamedTo(Rn.profileAddress);
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
                onPressed: (fydUser == null)
                    ? () {}
                    : () {
                        context.navigateNamedTo(Rn.help);
                      },
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () {
                context.read<FydUserCubit>().logOutUser();
              },
              child: FydText.b2custom(
                text: 'Logout',
                color: fydBlueGrey,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------

}
