import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verifyd_store/03%20domain/store/00_export_store_domain.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/04%20infrastructure/store/product_failure_mapper.dart';
import 'package:verifyd_store/04%20infrastructure/store/store_failure_mapper.dart';

@LazySingleton(as: IStoreRepository)
class FirebaseStoreRepository implements IStoreRepository {
  final FirebaseFirestore _firestore;
  FirebaseStoreRepository(this._firestore);
//?-----------------------------------------------------------------------------
  static const int storeFetchLimit = 5;
  static const int productFetchLimit = 15;
  // collection refference via extensions
  late CollectionReference storesCollection = _firestore.storesCollection();
//?-----------------------------------------------------------------------------
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
        .orderBy('storeId')
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
    } catch (e) {
      //error handling
      log(e.toString());
      return left(StoreFailureMapper.failureMapper(e));
    }
  }

//?-----------------------------------------------------------------------------
  //! Interface
  @override
  Stream<Either<StoreFailure, Store>> getStoreRealTime(
      {required String storeRef}) async* {
    var storeDoc = _firestore.doc(storeRef).withConverter<Store>(
        fromFirestore: (snapshot, _) => Store.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* storeDoc.snapshots().map((qSnapshot) {
      return right<StoreFailure, Store>(qSnapshot.data()!);
    }).onErrorReturnWith((e, stackTrace) {
      log(e.toString());
      return left(StoreFailureMapper.failureMapper(e));
    });
  }

//?-----------------------------------------------------------------------------
  //! Interface
  @override
  Future<Either<ProductFailure, List<Product>>> getProductsByType(
      {required String type,
      required String productsCollectionRef,
      String? startAfterSkuId}) async {
    // query to get products by (inStock + type) + orderby skuId + limit to 15
    var qProducts = _firestore
        .collection(productsCollectionRef)
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
    } catch (e) {
      // error handling
      log(e.toString());
      return left(ProductFailureMapper.failureMapper(e));
    }
  }

//?-----------------------------------------------------------------------------
  //! interface
  @override
  Stream<Either<ProductFailure, Product>> getProductRealTime(
      {required String productRef}) async* {
    final qProducts = _firestore.doc(productRef).withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* qProducts.snapshots().map((dSnapshot) {
      return right<ProductFailure, Product>(dSnapshot.data()!);
    }).onErrorReturnWith((e, stackTrace) {
      log(e.toString());
      return left(ProductFailureMapper.failureMapper(e));
    });
  }

//?-----------------------------------------------------------------------------
  //! interface
  @override
  Future<Either<ProductFailure, Product>> getProduct(
      {required String productRef}) async {
    final productDoc = _firestore.doc(productRef).withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());
    try {
      final product = await productDoc.get().then((value) => value.data()!);
      return right(product);
    } catch (e) {
      log(e.toString());
      return left(ProductFailureMapper.failureMapper(e));
    }
  }
//?-----------------------------------------------------------------------------
}
