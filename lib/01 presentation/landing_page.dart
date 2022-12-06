import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

class LandingWrapperPage extends StatelessWidget {
  const LandingWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key) {
    getIt<FydUserCubit>().getUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FydUserCubit, FydUserState>(
      listener: (context, state) {
        if (state.loadingState != true) {
          final authStatus = state.authUser;
          final fydUserStatus = state.fydUser;
          if (authStatus == null) {
            // push login route
            log('going to phoneLogin');
            context.router.replaceNamed('/phoneLogin');
          } else {
            if (fydUserStatus == null) {
              // push onBoarding route
              context.router.replaceNamed('/onBoarding');
            } else {
              // push home route
              context.router.replaceNamed('/testPage');
            }
          }
        }
      },
      child: const Scaffold(
        backgroundColor: fydPDgrey,
        body: Center(
          child: SpinKitWave(color: fydPWhite, size: 40.0),
        ),
      ),
    );
  }
}
