import 'package:dartz/dartz.dart';

import 'cart.dart';
import 'cart_failure.dart';

abstract class ICartRepository {
  Stream<Either<CartFailure, Cart>> getCartRealtime();

  // Add new cart--will delete previous cart and add (provided)cart
  Future<Either<CartFailure, Unit>> addNewCart({
    required Cart cart,
  });
  // Add New Sku-Id product into cartMap
  Future<Either<CartFailure, Unit>> addNewProduct({
    required String skuId,
    required Map<String, int> sizeQty,
  });
  // Add New Size in existing Sku-Id product
  // Future<Either<CartFailure, Unit>> addNewSize({
  //   required String cartRef,
  //   required String skuId,
  //   required SizeQty sizeQty,
  // });
  // update Size in existing Sku-Id product
  Future<Either<CartFailure, Unit>> updateSize({
    required String skuId,
    required String size,
    required int updateBy,
  });
  // remove removeSize product
  // check if its the only size of the sku
  // if yes then remove the sku itself
  Future<Either<CartFailure, Unit>> removeSize({
    required String skuId,
    required String size,
    required int removedQty,
  });
  // remove sku product
  Future<Either<CartFailure, Unit>> removeSku(
      {required String skuId, required int removedQty});
  // clear Cart--remove all products
  Future<Either<CartFailure, Unit>> clearCart();
}
