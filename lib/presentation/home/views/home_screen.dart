import 'package:flutter/material.dart';
import 'package:fyd_ui/fyd_ui.dart';
import 'package:verifyd_store/controllers/auth_checker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fydPDgrey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AuthChecker.instance.auth.currentUser?.uid ?? 'no current user',
              style: const TextStyle(color: Colors.white, fontSize: 36.0),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                FydLoader.showLoading();
                Future<void>.delayed(const Duration(seconds: 1), () {
                  AuthChecker.instance.auth.signOut();
                });
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 40.0,
                color: fydPWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
