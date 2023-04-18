import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/db_helpers.dart';
import 'package:verifyd_store/utils/helpers/helpers.dart';
import 'package:verifyd_store/utils/routes/export_router.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

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
          leading: AppBarBtn.close(onPressed: () => context.router.pop()),
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
                        DbHelpers.getSharedInfoField(
                            SharedInfoFields.callingHours)]!,
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
                            SharedInfoFields.operatingHours)]!,
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
    final uId =
        context.select((FydUserCubit cubit) => cubit.state.fydUser!.uId);
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
              // Analytics logging
              getIt<AnalyticsService>().logHelpNeeded(helpBy: 'whatsapp');
              Helpers.launchWhatsApp(
                phone: state.sharedInfo!.support[
                    DbHelpers.getSharedInfoField(SharedInfoFields.whatsapp)]!,
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
            heading: Helpers.phoneMaskWithCountryCode(state.sharedInfo!.support[
                DbHelpers.getSharedInfoField(SharedInfoFields.phone)]!),
            onPressed: () async {
              // Analytics logging
              getIt<AnalyticsService>().logHelpNeeded(helpBy: 'phone');
              Helpers.launchPhone(
                phone: state.sharedInfo!.support[
                    DbHelpers.getSharedInfoField(SharedInfoFields.phone)]!,
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
                .support[DbHelpers.getSharedInfoField(SharedInfoFields.mail)]!,
            onPressed: () async {
              // Analytics logging
              getIt<AnalyticsService>().logHelpNeeded(helpBy: 'mail');
              await Helpers.launchMail(
                email: state.sharedInfo!.support[
                    DbHelpers.getSharedInfoField(SharedInfoFields.mail)]!,
                subject: 'Help from userId: $uId',
              );
            },
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
