import 'package:flutter/material.dart';
import 'package:verifyd_store/00%20ui-core/ui_exports.dart';

class FydCircularIndicator extends StatelessWidget {
  const FydCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        value: null,
        backgroundColor: fydSgrey,
        color: fydPwhite,
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
        backgroundColor: fydSgrey,
        color: fydSblack,
      ),
    );
  }
}
