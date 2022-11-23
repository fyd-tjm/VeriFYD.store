import 'package:get/get.dart';
import 'package:verifyd_store/application/auth/sign_in_controller.dart';
import 'package:verifyd_store/application/stores/product_ui_controller.dart';
import 'package:verifyd_store/application/stores/store_ui_controller.dart';
import 'package:verifyd_store/domain/store/store.dart';
import 'package:verifyd_store/presentation/authentication/ui%20controller/auth_ui_controller.dart';
import 'package:verifyd_store/application/core/auth_checker_controller.dart';
import 'package:verifyd_store/application/core/network_controller.dart';
import 'package:verifyd_store/application/core/shared_info_controller.dart';
import 'package:verifyd_store/application/stores/stores_ui_controller.dart';

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

//?-----------------------------------------------------------------------------
class AuthScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthUiController>(() => AuthUiController());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

//?-----------------------------------------------------------------------------
class SharedInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SharedInfoController>(SharedInfoController());
  }
}

//?-----------------------------------------------------------------------------
class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoresUiController>(() => StoresUiController());
  }
}

//?-----------------------------------------------------------------------------
class StoreBinding extends Bindings {
  final store;
  StoreBinding({required this.store});
  @override
  void dependencies() {
    Get.lazyPut<StoreUiController>(
      () => StoreUiController(store: store),
    );
  }
}

//?-----------------------------------------------------------------------------
class ProductBinding extends Bindings {
  final product;
  ProductBinding({required this.product});
  @override
  void dependencies() {
    Get.lazyPut<ProductUiController>(
        () => ProductUiController(product: product));
  }
}
//?-----------------------------------------------------------------------------
