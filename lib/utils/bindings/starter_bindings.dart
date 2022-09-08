import 'package:get/get.dart';
import 'package:verifyd_store/controllers/controllers.dart';

class StarterBinding extends Bindings {
  @override
  void dependencies() {
    Future<void>.delayed(
      const Duration(seconds: 8),
      () {
        // network controller
        Get.put<NetworkController>(NetworkController(), permanent: true);
        // authentication checking controller
        Get.put<AuthChecker>(AuthChecker(), permanent: true);
      },
    );
  }
}
