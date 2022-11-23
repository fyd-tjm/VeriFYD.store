import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verifyd_store/domain/store/i_store_repository.dart';
import 'package:verifyd_store/domain/store/product.dart';
import 'package:verifyd_store/domain/store/store_failure.dart';
import 'package:verifyd_store/domain/store/store.dart';
import 'package:verifyd_store/domain/store/product_failure.dart';
import 'package:verifyd_store/infrastructure/core/firebase_helper.dart';

@LazySingleton(as: IStoreRepository)
class FirebaseStoreRepository implements IStoreRepository {
  final FirebaseFirestore _firestore;
  FirebaseStoreRepository(this._firestore);
  static const int storeFetchLimit = 5;
  static const int productFetchLimit = 15;
  // collection refference via extensions
  late CollectionReference storesCollection = _firestore.storesCollection();

  //! Interface
  @override
  Future<Either<StoreFailure, List<Store>>> getStoresByCategory(
      {required String category, String? startAfterStoreId}) async {
    // query to get stores by category + orderby storeId + limit to 15
    var storesByCategoryQuery = storesCollection
        .withConverter<Store>(
            fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
            toFirestore: (store, _) => store.toJson())
        .where('isLive', isEqualTo: true)
        .where("categories", arrayContains: category)
        .orderBy('sId')
        .limit(storeFetchLimit);
    // query extension in case of paginated data
    if (startAfterStoreId != null) {
      storesByCategoryQuery =
          storesByCategoryQuery.startAfter([startAfterStoreId]);
    }
    // now fetching query data and returning it
    try {
      final storesList = await storesByCategoryQuery.get().then(
          (querySnapshot) => querySnapshot.docs.map((e) => e.data()).toList());
      return right(storesList);
    }
    // Firestore-server error handling
    on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const StoreFailure.permissionDenied());
      } else if (e.message!.contains('not-found')) {
        return left(const StoreFailure.notExistAnymore());
      } else {
        return left(const StoreFailure.serverError());
      }
    }
    // client error handling
    catch (e) {
      log(e.toString());
      return left(const StoreFailure.UnexpectedError());
    }
  }

  //! Interface
  @override
  Stream<Either<StoreFailure, Store>> getStoreRealTime(
      {required String storeId}) async* {
    var storeDocs = storesCollection.withConverter<Store>(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* storeDocs
        .where('isLive', isEqualTo: true)
        .where('sId', isEqualTo: storeId)
        .snapshots()
        .map((qSnapshot) {
      return right<StoreFailure, Store>(qSnapshot.docs.first.data());
    }).onErrorReturnWith((e, stackTrace) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const StoreFailure.permissionDenied());
      } else if (e is FirebaseException && e.message!.contains('not-found')) {
        return left(const StoreFailure.notExistAnymore());
      } else {
        return left(const StoreFailure.UnexpectedError());
      }
    });
  }

  //! Interface
  @override
  Future<Either<ProductFailure, List<Product>>> getProductsByType(
      {required String type,
      required String productsReference,
      String? startAfterSkuId}) async {
    // query to get products by (inStock + type) + orderby skuId + limit to 15
    var qProducts = _firestore
        .collection(productsReference)
        .withConverter<Product>(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .where("inStock", isEqualTo: true)
        .where("type", isEqualTo: type)
        .orderBy('skuId')
        .limit(productFetchLimit);

    // query extension in case of paginated data
    if (startAfterSkuId != null) {
      qProducts = qProducts.startAfter([startAfterSkuId]);
    }
    // now fetching query data and returning it
    try {
      final productList = await qProducts
          .get()
          .then((querySnapshot) => querySnapshot.docs.map((e) {
                return e.data();
              }).toList());
      return right(productList);
    }
    // Firestore-server error handling
    on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const ProductFailure.permissionDenied());
      } else if (e.message!.contains('not-found')) {
        return left(const ProductFailure.notExistAnymore());
      } else {
        return left(const ProductFailure.serverError());
      }
    }
    // client error handling
    catch (e) {
      log(e.toString());
      return left(const ProductFailure.unexpectedError());
    }
  }

  @override
  Stream<Either<ProductFailure, Product>> getProductRealTime(
      {required String productsReference}) async* {
    var qProducts = _firestore.doc(productsReference).withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* qProducts.snapshots().map((dSnapshot) {
      return right<ProductFailure, Product>(dSnapshot.data()!);
    }).onErrorReturnWith((e, stackTrace) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const ProductFailure.permissionDenied());
      } else if (e is FirebaseException && e.message!.contains('not-found')) {
        return left(const ProductFailure.notExistAnymore());
      } else {
        return left(const ProductFailure.unexpectedError());
      }
    });
  }
}
