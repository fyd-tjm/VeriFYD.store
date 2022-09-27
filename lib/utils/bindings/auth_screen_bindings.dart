import 'package:get/get.dart';
import 'package:verifyd_store/application/auth/sign_in_controller.dart';
import 'package:verifyd_store/presentation/authentication/ui%20controller/auth_ui_controller.dart';

class AuthScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthUiController>(() => AuthUiController());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
