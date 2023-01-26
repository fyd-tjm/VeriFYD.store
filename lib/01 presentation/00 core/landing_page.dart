import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';

//?-----------------------------------------------------------------------------
class LandingWrapperPage extends StatelessWidget {
  const LandingWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>()..getUserStatus(),
      child: const LandingPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FydUserCubit, FydUserState>(
      listener: (context, state) async {
        if (state.isFetching == false) {
          await Future.delayed(const Duration(milliseconds: 500));
          if (state.isAuthenticated == false) {
            // navigate to login
            context.router.replaceNamed(Rn.login);
          } else if (state.fydUser == null) {
            // navigate to onBoarding
            context.router.replaceNamed(Rn.boarding);
          } else {
            getIt<SharedInfoCubit>().getSharedInfoRealtime();
            // navigate to main
            context.router.replaceNamed(Rn.main);
          }
        }
      },
      child: const Scaffold(
        body: SafeArea(
          child: Center(
            child: SpinKitWave(color: fydPWhite, size: 40.0),
          ),
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}
