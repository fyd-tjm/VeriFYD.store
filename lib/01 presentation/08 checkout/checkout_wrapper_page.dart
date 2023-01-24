import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/02%20application/checkout/checkout_bloc.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/02%20application/shared%20info/shared_info_cubit.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

//?-----------------------------------------------------------------------------

class CheckoutWrapperPage extends StatelessWidget {
  const CheckoutWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CheckoutBloc>()..add(CheckoutInitialization()),
        ),
        BlocProvider.value(
          value: getIt<FydUserCubit>(),
        ),
        BlocProvider.value(
          value: getIt<SharedInfoCubit>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}

//?-----------------------------------------------------------------------------