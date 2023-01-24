// // ignore_for_file: avoid_function_literals_in_foreach_calls

// import 'dart:async';
// import 'dart:developer';
// import 'package:dartz/dartz.dart';
// import 'package:get/get.dart';

// import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
// import 'package:verifyd_store/utils/helpers/logger.dart';

// import '../../03 domain/store/00_export_store_domain.dart';
// import '../../03 domain/store/store_failure.dart';

// class StoreUiController extends GetxController {
//   final store;
//   StoreUiController({required this.store});
// //?-----------------------------------------------------------------------------
//   final logger = getLogger('StoreUiController');
//   static StoreUiController i = Get.find();
//   final IStoreRepository iStoreRepo = getIt.get<IStoreRepository>();

// //?-----------------------------------------------------------------------------
//   final selectedTypeIndex = 0.obs;
//   final isFetching = true.obs;
//   final storeRealtime = Rxn<Store>();
//   final productByType = <String, List<Product>>{}.obs;
//   late StreamSubscription<Either<StoreFailure, Store>> subscription;

// //?-----------------------------------------------------------------------------
//   void resetValues() {
//     // logger.i('resetValues');
//     selectedTypeIndex.value = 0;
//     storeRealtime.value = null;
//     isFetching.value = true;
//     productByType.value = {};
//   }
// //?-----------------------------------------------------------------------------

//   void refreshReactiveVariables() {
//     productByType.refresh();
//     storeRealtime.refresh();
//   }
// //?-----------------------------------------------------------------------------

//   @override
//   void onInit() {
//     resetValues();
//     ever(selectedTypeIndex, (v) => onTypeIndexChange());
//     getStoreRealtime();
//     super.onInit();
//   }

// //?-----------------------------------------------------------------------------
// //todo: add storeID via Navigation

//   void getStoreRealtime() {
//     // logger.i('getStoreRealtime');
//     subscription = iStoreRepo
//         .getStoreRealTime(storeId: store.sId)
//         .listen((failureOrStore) {
//       failureOrStore.fold(
//         (failure) => logger.e(failure.toString()),
//         (store) {
//           storeRealtime.value = store;
//           updateProductByType();
//         },
//       );
//       refreshReactiveVariables();
//     });
//   }

// //?-----------------------------------------------------------------------------
//   void updateProductByType() {
//     // logger.i('updateProductByType');

//     if (storeRealtime.value != null) {
//       storeRealtime.value!.types.keys.forEach((type) {
//         //! initializing every new type not localy present
//         productByType.putIfAbsent(type, () => <Product>[]);
//       });
//       getProducts();
//       refreshReactiveVariables();
//     }
//   }

// //?-----------------------------------------------------------------------------
//   void onTypeIndexChange() {
//     // logger.i("onTypeIndexChange");

//     isFetching.value = true;
//     getProducts();
//     refreshReactiveVariables();
//   }

// //?-----------------------------------------------------------------------------
//   getProducts() {
//     // logger.i('getProducts');
//     //! 1 get requested productType via Selected Index
//     //! 2 check if products stored in local productsByType Map's list
//     // 2.1 if not stored
//     // 2.1.1 check if products available via storeRealTime 'types'
//     // 2.1.1.1 if yes Fetch and add products from db

//     var selectedProductType =
//         productByType.keys.elementAt(selectedTypeIndex.value);

//     if (productByType[selectedProductType]!.isEmpty) {
//       var productAvailability = storeRealtime.value!.types[selectedProductType];
//       if (productAvailability! > 0) {
//         fetchProducts(null);
//       } else {
//         isFetching.value = false;
//       }
//     } else {
//       isFetching.value = false;
//     }
//     refreshReactiveVariables();
//   }

// //?-----------------------------------------------------------------------------
//   void fetchProducts(String? fetchAfterSkuId) async {
//     // logger.i('fetchProducts');
//     //! 1 fetch products of selected type
//     //! 2 check if fetchedList of products already inside locallist
//     //  2.1 if not => add it to locallist(productsByType)

//     var selectedProductType =
//         productByType.keys.elementAt(selectedTypeIndex.value);

//     var failureOrProducts = await iStoreRepo.getProductsByType(
//       type: selectedProductType,
//       startAfterSkuId: fetchAfterSkuId,
//       productsReference: storeRealtime.value!.productsRef,
//     );

//     failureOrProducts.fold(
//       (productFailure) => logger.e(productFailure.toString()),
//       (remoteProductsList) {
//         remoteProductsList.forEach((remoteProduct) {
//           var localProductSkuId = productByType[selectedProductType]!
//               .map((product) => product.skuId)
//               .toList();

//           if (localProductSkuId.contains(remoteProduct.skuId) == false) {
//             productByType[selectedProductType]!.add(remoteProduct);
//             log(productByType[selectedProductType]!.length.toString());
//           }
//         });
//       },
//     );
//     refreshReactiveVariables();
//     isFetching.value = false;
//   }
// //?-----------------------------------------------------------------------------

//   @override
//   void onClose() async {
//     // logger.d('onClose');
//     await subscription.cancel();
//     super.onClose();
//   }

// //?-----------------------------------------------------------------------------
// }
