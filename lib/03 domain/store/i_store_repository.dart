import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';
import '00_export_store_domain.dart';

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

  //! get Product by skuId
  Future<Either<ProductFailure, Product>> getProductBySkuId(
      {required String storeId, required String skuId});
}
