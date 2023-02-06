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
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<FydUserCubit, FydUserState>(
        listenWhen: (previous, current) {
          //-------
          if (context.router.currentUrl == '/orders') return true;
          return false;
        },
        listener: (context, state) {
          //--------
          if (state.failureOrSuccess.isSome()) {
            state.failureOrSuccess.fold(
                () => null,
                (failureOrSuccess) => failureOrSuccess.fold(
                      (failure) {
                        showSnack(
                          context: context,
                          message: 'something went wrong!',
                        );
                        context.navigateNamedTo(Rn.home);
                      },
                      (success) => null,
                    ));
          }
        },
        buildWhen: (previous, current) {
          //-------
          if (context.router.currentUrl == '/orders') return true;
          return false;
        },
        builder: (context, state) {
          if (state.updating || state.fydOrders == null) {
            return const Center(
              child: SpinKitWave(
                color: fydLogoBlue,
                size: 40,
              ),
            );
          } else {
            return FydView(
              pageViewType: ViewType.without_Nav_Bar,
              isScrollable: false,
              topSheetHeight: 150.h,
              topSheet: _topSheetView(context, state),
              bottomSheet: _bottomSheetView(context, state),
            );
          }
        },
      )),
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
        //! AppBar (heading + back-Btn )
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
                  Icons.arrow_back_ios_new_rounded,
                  size: 25.w,
                  color: fydPWhite,
                ),
              ),
              //! close navigation
              onPressed: () {
                context.navigateNamedTo('/main/profile');
              },
            ),
          ),
          main: Center(
            child: FydText.d3black(
              text: 'Orders',
              weight: FontWeight.bold,
            ),
          ),
        ),
        //! orders-info-section
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Active orders
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FydText.b2black(
                    text: 'Active-Orders :  ',
                    weight: FontWeight.bold,
                  ),
                  // FydText.b1black(text: ':'),
                  FydText.b2custom(
                    text: activeOrders.toString().padLeft(2, '0'),
                    color: fydBlueGrey,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: FydDivider(
                  color: fydBlueGrey,
                ),
              ),
              // Operating-Hours
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FydText.b2black(
                    text: 'Total-Orders :  ',
                    weight: FontWeight.bold,
                  ),
                  // FydText.b1black(text: ':'),
                  FydText.b2custom(
                    text: state.fydOrders!.length.toString().padLeft(2, '0'),
                    color: fydBlueGrey,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 25.h),
        physics: const BouncingScrollPhysics(),
        children: List.generate(state.fydOrders!.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: OrdersTile(
              fydOrder: state.fydOrders![index],
              onPressed: (fydOrder) => context
                  .navigateTo(OrderDetailsWrapperRoute(fydOrder: fydOrder)),
            ),
          );
        }),
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
      height: 150.h,
      width: double.infinity,
      child: InkWell(
        splashColor: fydLogoBlue,
        onTap: () {
          HapticFeedback.mediumImpact();
          onPressed(fydOrder);
        },
        child: Card(
          color: fydPGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FydText.b2custom(
                          text: 'Order ${fydOrder.orderId}',
                          weight: FontWeight.w600,
                          color: fydBlueGrey,
                        ),
                        FydText.b2white(
                          text: 'StoreId ${fydOrder.orderInfo.storeId}',
                          weight: FontWeight.w600,
                          color: fydBlueGrey,
                        ),
                        FydText.b3white(
                          text:
                              '${fydOrder.orderInfo.orderSummary.totalItems} Items',
                          weight: FontWeight.w600,
                          color: fydBlueGrey,
                        ),
                      ],
                    ),
                    FydText.b4custom(
                      color: fydTGrey,
                      text:
                          DateFormat("dd-MM-yyyy").format(fydOrder.orderDate!),
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FydText.b1white(
                            text: '₹ ${fydOrder.paymentInfo.paymentAmount}',
                            weight: FontWeight.bold)
                      ],
                    ),
                    FydText.b4white(
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
                        failure: (f) => fydPGrey,
                        success: () => fydLogoGreen,
                        confirmed: () => fydLogoGreen,
                        declined: () => fydNotifRed,
                        shipped: () => fydLogoYellow,
                        delivered: (date) => fydSOrange,
                        fullFilled: () => fydBlueGrey,
                        refunded: (id) => fydNotifRed.withOpacity(.6),
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
