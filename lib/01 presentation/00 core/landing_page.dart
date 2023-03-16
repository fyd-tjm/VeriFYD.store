// ignore_for_file: use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/core/network/network_cubit.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';

import 'widgets/fyd_network_dialog.dart';

//?-----------------------------------------------------------------------------
class LandingWrapperPage extends StatelessWidget {
  LandingWrapperPage({Key? key}) : super(key: key);
  final FydNetworkDialog _networkDialog = getIt<FydNetworkDialog>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FydUserCubit>()..getUserStatus(),
        ),
        BlocProvider.value(
          value: getIt<NetworkCubit>(),
        ),
      ],
      child: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state.isNetworkAvailable == false) {
            _networkDialog.show(context);
          } else {
            _networkDialog.hide();
          }
        },
        child: const LandingPage(),
      ),
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
          await Future.delayed(const Duration(milliseconds: 600));
          // navigate to login
          if (state.isAuthenticated == false) {
            context.router.replaceNamed(Rn.login);
          }
          // navigate to onBoarding
          else if (state.onBoardingStatus == false) {
            context.router.replaceNamed(Rn.boarding);
          }
          // navigate to main
          else if (state.fydUser != null) {
            context.router.replaceNamed(Rn.main);
          }
        }
      },
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: SpinKitWave(color: fydPwhite, size: 40.0),
          ),
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------
}
