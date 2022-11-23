import 'dart:developer';

import 'package:get/get.dart';

class HomeRootNavController extends GetxController {
  static final HomeRootNavController i = HomeRootNavController();
  var activeIndex = 0.obs;
  void updateIndex(int index) {
    activeIndex.value = index;
    log(activeIndex.toString());
    update();
  }
}
