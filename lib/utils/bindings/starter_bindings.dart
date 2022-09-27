import 'package:get/get.dart';
import 'package:verifyd_store/application/core/auth_checker_controller.dart';
import 'package:verifyd_store/application/core/network_controller.dart';

class StarterBinding extends Bindings {
  @override
  void dependencies() {
    Future<void>.delayed(
      const Duration(seconds: 8),
      () {
        // network controller
        Get.put<NetworkController>(NetworkController(), permanent: true);
        // authentication checking controller
        Get.put<AuthCheckerController>(AuthCheckerController(),
            permanent: true);
      },
    );
  }
}
