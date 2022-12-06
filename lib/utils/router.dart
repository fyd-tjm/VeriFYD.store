import 'package:auto_route/auto_route.dart';
import 'package:verifyd_store/01%20presentation/00%20core/landing_page.dart';
import 'package:verifyd_store/01%20presentation/01%20login/otp_login_page.dart';
import 'package:verifyd_store/01%20presentation/01%20login/phone_login_page.dart';
import 'package:verifyd_store/01%20presentation/02%20on%20boarding/on_boarding_page.dart';
import 'package:verifyd_store/01%20presentation/test_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: LandingWrapperPage,
      initial: true,
    ),
    CustomRoute(
      path: '/phoneLogin',
      name: 'LoginRouter',
      page: PhoneLoginWrapperPage,
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 80,
      children: [
        CustomRoute(
          path: '',
          page: PhoneLoginPage,
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 80,
        ),
        CustomRoute(
          path: 'loginOtp',
          page: OtpLoginPage,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 80,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(path: '/onBoarding', page: OnBoardingWrapperPage),
    AutoRoute(path: '/testPage', page: TestWrapperPage),
  ],
)
class $AppRouter {}
