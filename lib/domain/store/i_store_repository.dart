import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/store/product.dart';
import 'package:verifyd_store/domain/store/product_failure.dart';
import 'package:verifyd_store/domain/store/store.dart';
import 'package:verifyd_store/domain/store/store_failure.dart';

abstract class IStoreRepository {
  //! to get list of Stores by category and limit by 15
  Future<Either<StoreFailure, List<Store>>> getStoresByCategory(
      {required String category, String? startAfterStoreId});

  //! to listen to selected store for real time changes (live or not)
  Stream<Either<StoreFailure, Store>> getStoreRealTime(
      {required String storeId});

  //! get only Live stores when on client end
  Future<Either<ProductFailure, List<Product>>> getProductsByType(
      {required String type,
      required String productsReference,
      String? startAfterSkuId});

  //! to listen to selected store for real time changes (live or not)
  Stream<Either<ProductFailure, Product>> getProductRealTime(
      {required String productsReference});
}
