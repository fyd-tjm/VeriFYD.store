import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';

class FydCircularIndicator extends StatelessWidget {
  const FydCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        value: null,
        backgroundColor: fydPLgrey,
        color: fydPWhite,
      ),
    );
  }
}

class FydLinearIndicator extends StatelessWidget {
  const FydLinearIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LinearProgressIndicator(
        value: null,
        backgroundColor: fydPLgrey,
        color: fydPGrey,
      ),
    );
  }
}
