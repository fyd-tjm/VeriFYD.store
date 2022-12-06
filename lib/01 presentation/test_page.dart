import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';

class TestWrapperPage extends StatelessWidget {
  const TestWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // log('/testPage');
    return BlocProvider.value(
      value: getIt<FydUserCubit>(),
      child: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStatus =
        context.select((FydUserCubit cubit) => cubit.state.authUser);
    if (authStatus == null) {
      context.router.replaceAll([const LandingWrapperRoute()]);
    }
    return Scaffold(
      backgroundColor: fydPDgrey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FydText.d1white(text: 'home'),
            IconButton(
              onPressed: () => context.read<FydUserCubit>().logOutUser(),
              icon: const Icon(
                Icons.login_rounded,
                color: fydPWhite,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
