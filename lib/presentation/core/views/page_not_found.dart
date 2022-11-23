import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: fydPGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FydText.h2white(text: 'Page Not Found'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FydBtn(
              fydText: FydText.b2black(text: 'Go Back'),
              onPressed: (() {}),
            ),
          ),
        ],
      ),
    ));
  }
}
