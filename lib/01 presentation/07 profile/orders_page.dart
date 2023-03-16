import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/00_core_widgets_export.dart';
import 'package:verifyd_store/02%20application/fyd%20user/fyd_user_cubit.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.dart';
import 'package:verifyd_store/utils/router.gr.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<FydUserCubit, FydUserState>(
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
                          context.navigateNamedTo(Rn.home);
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
                topSheet: _topSheetView(context, state),
                bottomSheet: _bottomSheetView(context, state),
              );
            }
          },
        ),
      ),
    );
  }

//?-----------------------------------------------------------------------------
  _topSheetView(BuildContext context, FydUserState state) {
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
          leading: AppBarBtn(
              iconData: Icons.close_rounded,
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.router.pop();
              }),
          //! Heading
          main: const Center(
            child: FydText.d3custom(
              text: 'Orders',
              color: fydSblack,
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
              //Total orders
            ],
          ),
        )
      ],
    );
  }

//?-----------------------------------------------------------------------------
  _bottomSheetView(BuildContext context, FydUserState state) {
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
                    'assets/logo/no-orders.png',
                    fit: BoxFit.fitWidth,
                    width: 100.w,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              const FydText.b1custom(
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
//?-----------------------------------------------------------------------------
} //ordersPage

//?-----------------------------------------------------------------------------
//! Orders-Tile
class OrdersTile extends StatelessWidget {
  final FydOrder fydOrder;
  final Function(FydOrder) onPressed;
  const OrdersTile({Key? key, required this.fydOrder, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: InkWell(
        splashColor: fydBblue,
        onTap: () {
          HapticFeedback.mediumImpact();
          onPressed(fydOrder);
        },
        child: Card(
          color: fydSblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //! upper section
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! id: storeName: itemsCount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! orderId
                        FydText.b2custom(
                          text: 'Order-Id: ${fydOrder.orderId}',
                          weight: FontWeight.w600,
                          color: fydBbluegrey,
                        ),
                        //! storeName
                        FydText.b4custom(
                          text: fydOrder.orderInfo.storeName,
                          weight: FontWeight.w600,
                          color: fydPgrey,
                        ),
                        //! itemCount
                        FydText.b4custom(
                          text:
                              '${fydOrder.orderInfo.orderSummary.totalItems} Items',
                          weight: FontWeight.w600,
                          color: fydPgrey,
                        ),
                      ],
                    ),
                    //! date
                    FydText.b4custom(
                      color: fydBbluegrey,
                      text:
                          DateFormat("dd-MM-yyyy").format(fydOrder.orderDate!),
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                //! lower section
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! price
                    FydText.b2white(
                      text: '₹ ${fydOrder.paymentInfo.paymentAmount}',
                      weight: FontWeight.bold,
                      color: fydBbluegrey,
                    ),
                    //! status
                    FydText.b4custom(
                      text: fydOrder.orderStatus.when(
                        failure: (f) => '',
                        success: () => 'Processing',
                        confirmed: () => 'Confirmed',
                        declined: () => 'Declined',
                        shipped: () => 'Shipped',
                        delivered: (date) => 'Delivered',
                        fullFilled: () => 'FullFilled',
                        refunded: (id) => 'Refunded',
                      ),
                      weight: FontWeight.bold,
                      color: fydOrder.orderStatus.when(
                        failure: (f) => Colors.transparent,
                        success: () => fydAgreen,
                        confirmed: () => fydAgreen,
                        declined: () => fydAred,
                        shipped: () => fydAyellow,
                        delivered: (date) => fydAorange,
                        fullFilled: () => fydBbluegrey,
                        refunded: (id) => fydAred.withOpacity(.5),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
