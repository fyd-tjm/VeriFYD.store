import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
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
              //TODO: close navigation
              onPressed: () {},
            ),
          ),
          main: Center(
            child: FydText.d2black(text: 'Help'),
          ),
        ),
        FydDivider(context: context),
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
                  // FydText.b1black(text: ':'),
                  FydText.b2custom(
                    text: state.sharedInfo?.timmings['callingHours']! ??
                        '10:00 - 18:00',
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
                  // FydText.b1black(text: ':'),
                  FydText.b2custom(
                    text: state.sharedInfo?.timmings['operatingHours']! ??
                        '09:00 - 22:00',
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
              final String whatsappNumber =
                  state.sharedInfo?.support['whatsapp'] ?? '919690590197';
              final Uri launchUri = Uri.parse(
                'https://wa.me/$whatsappNumber',
              );
              await launchUrl(launchUri, mode: LaunchMode.externalApplication);
            },
          ),
          //! phone expansion
          HelpTile(
            icon: const Icon(
              Icons.phone_outlined,
              size: 40,
              color: fydSPink,
            ),
            heading: Helpers.phoneMaskWithCountryCode(
                state.sharedInfo?.support['phone'][0]),
            onPressed: () async {
              final Uri launchUri = Uri(
                scheme: 'tel',
                path: state.sharedInfo?.support['phone'][0] ?? '+9196905907',
              );
              await launchUrl(launchUri);
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
            subHeading:
                state.sharedInfo?.support['mail'] ?? 'verifyd@gmail.com',
            onPressed: () async {
              //--------
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              //--------
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: state.sharedInfo?.support['mail'] ??
                    'fyd.technologies@gmail.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'user Help via verifyd.store ',
                }),
              );
              //--------

              await launchUrl(emailLaunchUri);
              //-------
            },
          ),
        ],
      ),
    );
  }

//?-----------------------------------------------------------------------------
}
