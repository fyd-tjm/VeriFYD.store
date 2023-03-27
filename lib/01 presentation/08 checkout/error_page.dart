import 'package:flutter/material.dart';
import 'package:verifyd_store/01%20presentation/00%20core/widgets/core_exports.dart';

//?-----------------------------------------------------------------------------

class CheckoutErrorWrapperPage extends StatelessWidget {
  const CheckoutErrorWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CheckoutErrorPage();
  }
}

//?-----------------------------------------------------------------------------

class CheckoutErrorPage extends StatelessWidget {
  const CheckoutErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FydView(
          pageViewType: ViewType.without_Nav_Bar,
          isScrollable: false,
          topSheetHeight: 350.h,
          topSheet: _topSheetView(context),
          bottomSheet: _bottomSheetView(context),
        ),
      ),
    );
  }
//?-----------------------------------------------------------------------------

  _topSheetView(BuildContext context) {
    return Column();
  }

//?-----------------------------------------------------------------------------

  _bottomSheetView(BuildContext context) {
    return Column();
  }

//?-----------------------------------------------------------------------------
}// CheckoutErrorPage
//?-----------------------------------------------------------------------------