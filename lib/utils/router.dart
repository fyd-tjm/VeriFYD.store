import 'package:auto_route/annotations.dart';
import 'package:verifyd_store/01%20presentation/landing_page.dart';
import 'package:verifyd_store/01%20presentation/on_boarding_page.dart';
import 'package:verifyd_store/01%20presentation/otp_login_page.dart';
import 'package:verifyd_store/01%20presentation/phone_login_page.dart';
import 'package:verifyd_store/01%20presentation/test_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: LandingWrapperPage,
      initial: true,
    ),
    AutoRoute(
      path: '/phoneLogin',
      name: 'LoginRouter',
      page: PhoneLoginWrapperPage,
      children: [
        AutoRoute(path: '', page: PhoneLoginPage),
        AutoRoute(path: 'loginOtp', page: OtpLoginPage),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(path: '/onBoarding', page: OnBoardingWrapperPage),
    AutoRoute(path: '/testPage', page: TestWrapperPage),
  ],
)
class $AppRouter {}
