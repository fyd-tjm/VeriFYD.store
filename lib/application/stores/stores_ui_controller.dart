import 'dart:developer';

import 'package:get/get.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/application/core/shared_info_controller.dart';

import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/helpers/logger.dart';

class StoresUiController extends GetxController {
  final logger = getLogger('StoresUiController');
  static StoresUiController i = Get.find();
  final IStoreRepository iStoreRepo = getIt.get<IStoreRepository>();
//?-----------------------------------------------------------------------------
  final selectedCategoryIndex = 0.obs;
  final storesByCategory = <String, List<Store>>{}.obs;
  final isFetching = true.obs;

//?-----------------------------------------------------------------------------

  void resetValues() {
    selectedCategoryIndex.value = 0;
    isFetching.value = true;
    storesByCategory.value = {};
  }
//?-----------------------------------------------------------------------------

  @override
  void onInit() {
    resetValues();
    updateStoresByCategory();
    ever(SharedInfoController.i.sharedInfo, (value) {
      // logger.d('ever on shareInfo');
      updateStoresByCategory();
    });
    ever(selectedCategoryIndex, (event) {
      isFetching.value = true;
      getStores();
      refreshReactiveVariables();
    });
    super.onInit();
  }

//?-----------------------------------------------------------------------------
  void refreshReactiveVariables() {
    storesByCategory.refresh();
  }

//?-----------------------------------------------------------------------------
  void updateStoresByCategory() {
    // logger.i('updateStoresByCategory');
    if (SharedInfoController.i.sharedInfo.value != null) {
      for (final item
          in SharedInfoController.i.sharedInfo.value!.liveStores.entries) {
        //! initializing storesByCategory
        storesByCategory.putIfAbsent(item.key, () => <Store>[]);
      }
      refreshReactiveVariables();
      getStores();
    }
  }

//?-----------------------------------------------------------------------------
  getStores() {
    //! get requested category via Selected Index
    //! check if stores stored in local storesByCategory Map list
    //! if not stored => check if stores available via liveStores
    //=> if yes Fetch and add stores from db
    //: else assign storesBycategory's list to storelistindex
    //! if stored than add it to StoreListForSelectedIndex and refresh it

    var selectedCategory =
        storesByCategory.keys.elementAt(selectedCategoryIndex.value);

    if (storesByCategory[selectedCategory]!.isEmpty) {
      var storesAvailability =
          SharedInfoController.i.sharedInfo.value!.liveStores[selectedCategory];
      if (storesAvailability! > 0) {
        fetchStores(null);
      } else {
        isFetching.value = false;
      }
    } else {
      isFetching.value = false;
    }
    refreshReactiveVariables();
  }

//?-----------------------------------------------------------------------------
  void fetchStores(String? fetchAfterSid) async {
    //! fetch Stores of selected Category
    //! check if fetchedList stores already inside locallist
    //! if not => add it to storesByCategory's respective list and storeListForSelectedIndex
    // log('fetching Stores via fetchStores');
    var selectedCategory =
        storesByCategory.keys.elementAt(selectedCategoryIndex.value);
    var failureOrStores = await iStoreRepo.getStoresByCategory(
        category: selectedCategory, startAfterStoreId: fetchAfterSid);

    failureOrStores.fold(
      (storeFailure) => log(storeFailure.toString()),
      (remoteStoresList) {
        remoteStoresList.forEach((remoteStore) {
          var localStoresSid = storesByCategory[selectedCategory]!
              .map((store) => store.sId)
              .toList();
          if (localStoresSid.contains(remoteStore.sId) == false) {
            storesByCategory[selectedCategory]!.add(remoteStore);
            log(storesByCategory[selectedCategory]!.length.toString());
          }
        });
      },
    );
    refreshReactiveVariables();
    isFetching.value = false;
  }
//?-----------------------------------------------------------------------------

  @override
  void onClose() {
    resetValues();
    super.onClose();
  }
//?-----------------------------------------------------------------------------
}
