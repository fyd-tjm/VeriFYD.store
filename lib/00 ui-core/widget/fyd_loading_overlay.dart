import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:injectable/injectable.dart';

import '../ui_exports.dart';

@lazySingleton
class FydLoadingOverlay {
  //-----
  OverlayEntry? _overlay;
  FydLoadingOverlay();
  //-----
  void show(BuildContext context) {
    log('show-loading-overlay');
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: const Color(0x80000000),
          child: Center(
            child: Card(
              color: const Color.fromARGB(221, 75, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: SpinKitWave(
                    color: fydPwhite,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    log('hide-loading-overlay');
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
