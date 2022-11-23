import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:verifyd_store/presentation/cart/views/cart_screen.dart';
import 'package:verifyd_store/presentation/core/ui%20controller/home_root_nav_controller.dart';
import 'package:verifyd_store/presentation/core/views/stores_root_screen.dart';
import 'package:verifyd_store/presentation/home/views/home_screen.dart';
import 'package:verifyd_store/presentation/profile/views/profile_screen.dart';

class IndexedRoot extends StatelessWidget {
  const IndexedRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeRootNavController());
    return Obx(() => LazyLoadIndexedStack(
          index: HomeRootNavController.i.activeIndex.value,
          children: const [
            HomeScreen(),
            StoresRootScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ));
  }
}
