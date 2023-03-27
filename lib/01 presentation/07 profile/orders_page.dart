import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/asset_helper.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

import 'widgets/orders_tile.dart';

//?-----------------------------------------------------------------------------
class OrdersWrapperPage extends StatelessWidget {
  const OrdersWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FydUserCubit>()..getFydOrders(),
      child: const OrdersPage(),
    );
  }
}

//?-----------------------------------------------------------------------------
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<FydUserCubit, FydUserState>(
          listenWhen: (previous, current) {
            if (context.router.currentUrl == '/orders') return true;
            return false;
          },
          listener: (context, state) {
            if (state.failureOrSuccess.isSome()) {
              state.failureOrSuccess.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                        (failure) {
                          showSnack(
                            context: context,
                            viewType: SnackBarViewType.withNav,
                            message: 'something went wrong!',
                          );
                          context.navigateNamedTo(Rn.profile);
                        },
                        (success) => null,
                      ));
            }
          },
          buildWhen: (previous, current) {
            if (context.router.currentUrl == '/orders') return true;
            return false;
          },
          builder: (context, state) {
            //! Loading
            if (state.updating || state.fydOrders == null) {
              return const Center(
                child: SpinKitWave(
                  color: fydBbluegrey,
                  size: 30,
                ),
              );
            }
            //! Orders-View
            else {
              return FydView(
                pageViewType: ViewType.without_Nav_Bar,
                isScrollable: false,
                topSheetHeight: 150.h,
                topSheet: _TopSheet(state: state),
                bottomSheet: _BottomSheet(state: state),
              );
            }
          },
        ),
      ),
    );
  }
}
//?-----------------------------------------------------------------------------

class _TopSheet extends StatelessWidget {
  final FydUserState state;
  const _TopSheet({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    //---------
    var activeOrders = 0;
    for (var fydOrder in state.fydOrders!) {
      if ((fydOrder.orderStatus != const OrderStatus.fullFilled()) &&
          (fydOrder.orderStatus != const OrderStatus.refunded())) {
        activeOrders++;
      }
    }
    //---------
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //! AppBar (backBTN + heading)
        FydAppBar(
          //! close-btn
          leading: AppBarBtn.close(onPressed: () {
            HapticFeedback.mediumImpact();
            context.router.pop();
          }),
          //! Heading
          main: const Center(
            child: FydText.d3custom(
              text: 'Orders',
              color: fydSblack,
              letterSpacing: 1.3,
            ),
          ),
        ),
        //! orders-info-section
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //! Active orders
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FydText.b2custom(
                    text: 'Active-Orders :  ',
                    color: fydPgrey,
                  ),
                  FydText.b2custom(
                    text: activeOrders.toString().padLeft(2, '0'),
                    color: fydBblue,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: FydDivider(
                  color: fydBbluegrey,
                ),
              ),
              //! Total orders
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FydText.b2custom(
                    text: 'Total-Orders :  ',
                    color: fydPgrey,
                  ),
                  FydText.b2custom(
                    text: state.fydOrders!.length.toString().padLeft(2, '0'),
                    color: fydBblue,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

//?-----------------------------------------------------------------------------

class _BottomSheet extends StatelessWidget {
  final FydUserState state;
  const _BottomSheet({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return (state.fydOrders!.isEmpty)
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetHelper.no_orders,
                    width: 100.w,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              const FydText.b2custom(
                text: 'It seems you have no Orders, Yet!',
                color: fydBbluegrey,
                letterSpacing: .8,
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    fydBblue,
                    Colors.transparent,
                    Colors.transparent,
                    fydBblue
                  ],
                  stops: [0.0, 0.04, 0.96, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
                physics: const BouncingScrollPhysics(),
                children: List.generate(state.fydOrders!.length, (index) {
                  return OrdersTile(
                    fydOrder: state.fydOrders![index],
                    onPressed: (fydOrder) => context.navigateTo(
                        OrderDetailsWrapperRoute(fydOrder: fydOrder)),
                  );
                }),
              ),
            ),
          );
  }
}

//?-----------------------------------------------------------------------------

