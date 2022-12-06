import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../00 ui-core/ui_exports.dart';

class NetworkController extends GetxController {
  static NetworkController instance = Get.find();
  final isConnected = true.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivityCheck();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> connectivityCheck() async {
    log('checking connection');
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      // call Dialog
      fydDialog(
        title: 'Network Issue',
        message: 'There is no internet connectivity!',
        buttonName: 'Retry',
        onPresss: () {
          Get.back();
          connectivityCheck();
        },
      );
    } else {
      isConnected.value = true;
    }
  }
}
