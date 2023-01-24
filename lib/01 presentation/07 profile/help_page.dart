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
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import '../../02 application/shared info/shared_info_cubit.dart';
import 'widgets/exports.dart';

//?-----------------------------------------------------------------------------
class HelpWrapperPage extends StatelessWidget {
  const HelpWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<SharedInfoCubit>(),
        ),
        BlocProvider.value(
          value: getIt<FydUserCubit>(),
        ),
      ],
      child: const HelpPage(),
    );
  }
}

//?-----------------------------------------------------------------------------

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fydPDgrey,
      body: SafeArea(
        child: BlocBuilder<SharedInfoCubit, SharedInfoState>(
          builder: (context, state) {
            return (state.sharedInfo == null)
                ? const Center(
                    child: SpinKitWave(
                      color: fydPDgrey,
                      size: 30.0,
                    ),
                  )
                : FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 170.h,
                    topSheetColor: fydSPink,
                    topSheet: _topSheetView(context, state),
                    bottomSheet: _bottomSheetView(context, state),
                  );
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context, SharedInfoState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! appBar(back-btn + heading)
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
                // context.navigateNamedTo('/main/home');
                // log(context.router.currentUrl);
              },
            ),
          ),
          main: Center(
            child: FydText.d2black(text: 'Help'),
          ),
        ),
        const FydDivider(),
        //! timmings via sharedInfo
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Calling-Hours
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FydText.b2black(
                    text: 'Calling-Hours :  ',
                    weight: FontWeight.bold,
                  ),
                  FydText.b2custom(
                    text: state.sharedInfo!.timmings[
                        DbHelpers.getSharedInfoField(SharedInfo.callingHours)]!,
                    color: fydSCPink,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              // Operating-Hours
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FydText.b2black(
                    text: 'Operating-Hours :  ',
                    weight: FontWeight.bold,
                  ),
                  FydText.b2custom(
                    text: state.sharedInfo!.timmings[
                        DbHelpers.getSharedInfoField(
                            SharedInfo.operatingHours)]!,
                    color: fydSCPink,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheetView(BuildContext context, SharedInfoState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! whatsApp
          HelpTile(
            icon: const Icon(
              Icons.whatsapp_sharp,
              size: 40,
              color: fydSPink,
            ),
            heading: 'Whatsapp support. Quick resolution',
            subHeading: '(recommended)',
            onPressed: () async {
              Helpers.launchWhatsApp(
                phone: state.sharedInfo!.support[
                    DbHelpers.getSharedInfoField(SharedInfo.whatsapp)]!,
              );
            },
          ),
          //! phone expansion
          HelpTile(
            icon: const Icon(
              Icons.phone_outlined,
              size: 40,
              color: fydSPink,
            ),
            heading: Helpers.phoneMaskWithCountryCode(state.sharedInfo!
                .support[DbHelpers.getSharedInfoField(SharedInfo.phone)]!),
            onPressed: () async {
              Helpers.launchPhone(
                phone: state.sharedInfo!
                    .support[DbHelpers.getSharedInfoField(SharedInfo.phone)]!,
              );
            },
          ),
          //! mail
          HelpTile(
            icon: const Icon(
              Icons.mail_rounded,
              size: 40,
              color: fydSPink,
            ),
            heading: 'Mail us at',
            subHeading: state.sharedInfo!
                .support[DbHelpers.getSharedInfoField(SharedInfo.mail)]!,
            onPressed: () async {
              await Helpers.launchMail(
                email: state.sharedInfo!
                    .support[DbHelpers.getSharedInfoField(SharedInfo.mail)]!,
                subject: 'Help with userId:  ',
              );
            },
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
