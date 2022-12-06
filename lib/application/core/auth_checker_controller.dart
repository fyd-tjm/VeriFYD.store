import 'dart:developer';

import 'package:get/get.dart';
import 'package:verifyd_store/domain/auth/i_auth_facade.dart';
import 'package:verifyd_store/domain/user/fyd_user.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

import 'package:verifyd_store/utils/router/routes.dart';

import '../../00 ui-core/ui_exports.dart';

class AuthCheckerController extends GetxController {
  static AuthCheckerController i = AuthCheckerController();
  final IAuthFacade iAuthFacade = getIt.get<IAuthFacade>();

  static late Rx<FydUser?> fydUser;

  @override
  void onInit() {
    super.onReady();
    // fydUser = Rx<FydUser?>(iAuthFacade.getCurrentUser());
    // log(fydUser.value.toString());
    // fydUser.bindStream(iAuthFacade.onAuthStateChanges());
    ever(fydUser, _initialScreen);
    super.onInit();
  }

  _initialScreen(FydUser? fydUser) {
    FydLoader.hideLoading();
// To Display login screen if no current user
    if (fydUser == null) {
      Get.offAllNamed(AppRoutes.getPhoneAuthRoute);
    }
// To Display Name Screen if there is no name for the user
    else if (fydUser.name == null) {
      Get.offAllNamed(AppRoutes.getNameAuthRoute);
    }
// To Display Home screen if there is  current user
    else {
      Get.offAllNamed(AppRoutes.getHomeRoute);
    }
  }

  void userSignOut() {
    iAuthFacade.signOut();
  }
}
