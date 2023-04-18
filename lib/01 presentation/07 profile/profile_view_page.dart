import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/routes/router.gr.dart';

import 'widgets/profile_tile.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<FydUserCubit, FydUserState>(
          listenWhen: (previous, current) {
            if (context.tabsRouter.currentUrl == Rn.profile) {
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
                      aborted: () => 'Failed! try again',
                      invalidArgument: () => 'Invalid Argument. try again',
                      alreadyExists: () => 'Data already Exists',
                      notFound: () => 'Data not found!',
                      permissionDenied: () => null,
                      serverError: () => 'Server Error: try again',
                      unknownError: () => 'Something went wrong: try again ',
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
              topSheet: _TopSheet(state: state),
              bottomSheet: _BottomSheet(state: state),
            );
          },
        ),
      ),
    );
  }
}

//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final FydUserState state;
  const _TopSheet({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
                ? () {}
                : () {
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
            //loading
            ? Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SpinKitWave(
                      color: fydPblack,
                      size: 40.0,
                    ),
                  ],
                ),
              )
            //Info
            : Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //! Name
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
                      child: FydText.h3custom(
                        color: fydPgrey,
                        text: fydUser.name,
                        weight: FontWeight.w600,
                      ),
                    ),
                    //! Phone
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: FydText.b2black(
                        text: Helpers.phoneMaskWithCountryCode(fydUser.phone),
                        weight: FontWeight.w700,
                      ),
                    ),
                    //! email
                    FydText.b3custom(
                      color: fydPgrey,
                      text: '(${fydUser.email})',
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final FydUserState state;
  const _BottomSheet({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
                iconAsset: AssetHelper.svg_orders,
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
                iconAsset: AssetHelper.svg_addresses,
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
                iconAsset: AssetHelper.svg_help,
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
                HapticFeedback.mediumImpact();
                await context.read<FydUserCubit>().logOutUser();
                context.router.replaceAll([LandingWrapperRoute()]);
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
}

//?-----------------------------------------------------------------------------
