import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: fydPDgrey,
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }
}
