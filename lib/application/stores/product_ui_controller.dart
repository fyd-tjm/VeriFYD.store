import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/logger.dart';

import '../../03 domain/store/00_export_store_domain.dart';

class ProductUiController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  ProductUiController({required this.product});
//?-----------------------------------------------------------------------------

  static ProductUiController i = Get.find();
  final logger = getLogger('ProductUiController');
  final IStoreRepository iStoreRepo = getIt.get<IStoreRepository>();

//?-----------------------------------------------------------------------------
  final sizeController = GroupButtonController();
  late StreamSubscription<Either<ProductFailure, Product>> subscription;
  final indicatorIndex = 0.obs; // productCarousel
  final isFetching = true.obs;
  final productRealtime = Rxn<Product>();
  final availableSizeRealtime = <String>[].obs;

//?-----------------------------------------------------------------------------
  void resetValues() {
    logger.i('resetValues');
    productRealtime.value = null;
    availableSizeRealtime.value = [];
    isFetching.value = true;
  }

//?-----------------------------------------------------------------------------
  @override
  void onInit() {
    resetValues();
    getProductRealtime();
    // ever(productRealtime, (v) => updateAvailableSize());

    super.onInit();
  }
//?-----------------------------------------------------------------------------
//todo: add skuId and productRef via Navigation

  void getProductRealtime() {
    // logger.i('getProductRealtime');
    // subscription = iStoreRepo
    //     .getProductRealTime(productsReference: product.productRef)
    //     .listen((failureOrProduct) {
    //   failureOrProduct.fold(
    //     (failure) => logger.e(failure.toString()),
    //     (product) {
    //       productRealtime.value = product;
    //       logger.i(product);
    //       updateAvailableSize();
    //     },
    //   );
    //   isFetching.value = false;
    //   refreshReactiveVariables();
    // });
  }

//?-----------------------------------------------------------------------------
  void refreshReactiveVariables() {
    productRealtime.refresh();
    availableSizeRealtime.refresh();
  }

//?-----------------------------------------------------------------------------
  void updateAvailableSize() {
    logger.i('updateAvailableSize');
    if (productRealtime.value != null) {
      availableSizeRealtime.clear();
      productRealtime.value!.sizeAvailability.entries
          .forEach((sizeAndAvailability) {
        if (!sizeAndAvailability.value.isEqual(0)) {
          var size = sizeAndAvailability.key;

          availableSizeRealtime.add(size);
          availableSizeRealtime.sort();
        }
      });
      logger.i(availableSizeRealtime);
      refreshReactiveVariables();
    }
  }
//?-----------------------------------------------------------------------------

}
