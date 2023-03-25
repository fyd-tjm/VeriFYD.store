import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
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
    return BlocProvider.value(
      value: getIt<SharedInfoCubit>(),
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SharedInfoCubit, SharedInfoState>(
          builder: (context, state) {
            return (state.sharedInfo == null)
                ? const Center(
                    child: SpinKitWave(
                      color: fydBblue,
                      size: 30.0,
                    ),
                  )
                : FydView(
                    pageViewType: ViewType.without_Nav_Bar,
                    isScrollable: false,
                    topSheetHeight: 170.h,
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
          leading: AppBarBtn.close(onPressed: () {
            HapticFeedback.mediumImpact();
            context.router.pop();
          }),
          main: const Center(
            child: FydText.d3black(
              text: 'Help',
              letterSpacing: 1.3,
            ),
          ),
        ),
        const FydDivider(
          color: fydBbluegrey,
        ),
        //! timmings via sharedInfo
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //! Calling-Hours
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FydText.b2black(
                    text: 'Calling-Hours :  ',
                    weight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                  FydText.b2custom(
                    text: state.sharedInfo!.timmings[
                        DbHelpers.getSharedInfoField(SharedInfo.callingHours)]!,
                    color: fydPgrey,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              //! Operating-Hours
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FydText.b2black(
                    text: 'Operating-Hours :  ',
                    weight: FontWeight.w600,
                  ),
                  FydText.b2custom(
                    text: state.sharedInfo!.timmings[
                        DbHelpers.getSharedInfoField(
                            SharedInfo.operatingHours)]!,
                    color: fydPgrey,
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
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! whatsApp
          HelpTile(
            icon: const Icon(
              FontAwesomeIcons.whatsapp,
              size: 40,
              color: fydBblue,
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
          SizedBox(
            height: 20.h,
          ),
          //! phone expansion
          HelpTile(
            icon: const Icon(
              Icons.phone_outlined,
              size: 40,
              color: fydBblue,
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
          SizedBox(
            height: 20.h,
          ),
          //! mail
          HelpTile(
            icon: const Icon(
              Icons.mail_rounded,
              size: 40,
              color: fydBblue,
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
