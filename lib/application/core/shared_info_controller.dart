import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:verifyd_store/domain/shared/i_shared_info_repository.dart';
import 'package:verifyd_store/domain/shared/shared_info.dart';
import 'package:verifyd_store/domain/shared/shared_info_failure.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';

class SharedInfoController extends GetxController {
  static SharedInfoController i = Get.find();
  final ISharedInfoRepository iSharedInfoRepo =
      getIt.get<ISharedInfoRepository>();
//?-----------------------------------------------------------------------------
  final sharedInfo = Rxn<SharedInfo>();
  late StreamSubscription<Either<SharedInfoFailure, SharedInfo>> subscription;
//?-----------------------------------------------------------------------------
  @override
  void onInit() {
    getSharedInfoRealtime();
    super.onInit();
  }

//?-----------------------------------------------------------------------------
  void getSharedInfoRealtime() {
    subscription =
        iSharedInfoRepo.getSharedInfo().listen((failureOrSharedInfo) {
      failureOrSharedInfo.fold(
        (failure) => log(failure.toString()),
        (shared) {
          sharedInfo.value = shared;
        },
      );
    });
  }

//?-----------------------------------------------------------------------------
  @override
  void onClose() async {
    // log('stream-cancelled');
    await subscription.cancel();
    super.onClose();
  }
//?-----------------------------------------------------------------------------
}
