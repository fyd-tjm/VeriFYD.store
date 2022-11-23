import 'package:flutter/material.dart';

class TestStoreScreen extends StatelessWidget {
  const TestStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
      ),
    );
  }
}
