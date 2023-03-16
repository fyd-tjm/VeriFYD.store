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
import 'package:verifyd_store/utils/router.gr.dart';

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
    log(context.router.currentUrl);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<FydUserCubit, FydUserState>(
          listenWhen: (previous, current) {
            if (context.tabsRouter.currentUrl == '/main/profile') {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                () => null,
                (userFailure) => userFailure.fold(
                  (failure) => showSnack(
                    viewType: SnackBarViewType.withNav,
                    context: context,
                    message: failure.when(
                      aborted: () => 'Failed! try again later',
                      invalidArgument: () => 'Invalid Argument. try again',
                      alreadyExists: () => 'Data already Exists',
                      notFound: () => 'Data not found!',
                      permissionDenied: () => 'Permission Denied',
                      serverError: () => 'Server Error. try again later',
                      unknownError: () =>
                          'Something went wrong. try again later',
                    ),
                  ),
                  (success) => showSnack(
                      context: context,
                      viewType: SnackBarViewType.withNav,
                      message: 'success!'),
                ),
              );
            }
          },
          builder: (context, state) {
            return FydView(
              pageViewType: ViewType.with_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 300.h,
              topSheet: _topSheetView(context, state),
              bottomSheet: _bottomSheetView(context, state),
            );
          },
        ),
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
          //! heading
          main: const Center(
              child: FydText.d3black(
            text: 'Profile',
            letterSpacing: 1.3,
          )),
          //! edit-btn
          trailing: AppBarBtn(
            iconData: Icons.mode_edit_outline_outlined,
            onPressed: (fydUser == null)
                ? null
                : () {
                    //! EditProfile Page navigation
                    context.router.navigateNamed(Rn.editProfile);
                  },
          ),
        ),
        //! Profile-Logo
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
                width: 100.h,
                child: Card(
                  color: fydPblack,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: fydBbluegrey,
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
                      color: fydPblack,
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
                    //! Name
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: FydText.h3custom(
                        color: fydPgrey,
                        text: fydUser.name,
                        weight: FontWeight.w600,
                      ),
                    ),

                    //! Phone
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: FydText.b2black(
                        text: Helpers.phoneMaskWithCountryCode(fydUser.phone),
                        weight: FontWeight.w700,
                      ),
                    ),

                    //! email
                    FydText.b2custom(
                      color: fydPgrey,
                      text: fydUser.email,
                      weight: FontWeight.w600,
                    ),
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
                iconColor: fydBblue,
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
                iconColor: fydBblue,
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
                iconColor: fydBblue,
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
          //! Logout-btn
          Center(
            child: TextButton(
              onPressed: () async {
                await context.read<FydUserCubit>().logOutUser();
                context.router.replaceAll([
                  LoginRouter(
                    children: const [PhoneLoginRoute()],
                  )
                ]);
              },
              child: const FydText.b2custom(
                text: 'Logout',
                color: fydBbluegrey,
                weight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
