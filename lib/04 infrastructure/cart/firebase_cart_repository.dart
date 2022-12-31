import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';

const cartCount = 'cartCount';
const cartMap = 'cartMap';

@LazySingleton(as: ICartRepository)
class FirebaseCartRepository implements ICartRepository {
//?-----------------------------------------------------------------------------
  final FirebaseFirestore _firestore;
  FirebaseCartRepository(this._firestore);

//?--Get-Cart-RealTime----------------------------------------------------------
  @override
  Stream<Either<CartFailure, Cart>> getCartRealtime(
      {required String cartRef}) async* {
    final cartDoc = _firestore.doc(cartRef).withConverter<Cart>(
        fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* cartDoc.snapshots().map((cartSnapshot) {
      return right<CartFailure, Cart>(cartSnapshot.data()!);
    }).onErrorReturnWith((error, stackTrace) {
      log(error.toString());
      //Todo: map failure
      return left(const CartFailure.serverError());
    });
  }

//?--Add-New-Cart---------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> addNewCart(
      {required String cartRef, required Cart cart}) async {
    var cartDoc = _firestore.doc(cartRef).withConverter<Cart>(
        fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    var result = await cartDoc.set(cart).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Add-New-Sku----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> addNewProduct(
      {required String cartRef,
      required String skuId,
      required Map<String, int> sizeQty}) async {
    var docRef = _firestore.doc(cartRef);

    var result = await docRef.set(
      {
        cartMap: {
          skuId: {sizeQty.keys.first: sizeQty.values.first}
        },
        cartCount: FieldValue.increment(1),
      },
      SetOptions(merge: true),
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Update-Size----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> updateSize(
      {required String cartRef,
      required String skuId,
      required String size,
      required int updateBy}) async {
    var docRef = _firestore.doc(cartRef);

    var result = await docRef.update(
      {
        '$cartMap.$skuId.$size': FieldValue.increment(updateBy),
        cartCount: FieldValue.increment(updateBy),
      },
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Remove-Size----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> removeSize(
      {required String cartRef,
      required String skuId,
      required String size,
      required int removedQty}) async {
    var docRef = _firestore.doc(cartRef);

    var result = await docRef.update(
      {
        '$cartMap.$skuId.$size': FieldValue.delete(),
        cartCount: FieldValue.increment(-removedQty),
      },
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Remove-Sku-----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> removeSku(
      {required String cartRef,
      required String skuId,
      required int removedQty}) async {
    var docRef = _firestore.doc(cartRef);

    var result = await docRef.update(
      {
        '$cartMap.$skuId': FieldValue.delete(),
        cartCount: FieldValue.increment(-removedQty),
      },
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Clear-Cart-----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> clearCart({required String cartRef}) async {
    var docRef = _firestore.doc(cartRef);

    var result = await docRef.update(
      {
        cartMap: {},
        cartCount: 0,
      },
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(const CartFailure.unexpectedError()));

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?-----------------------------------------------------------------------------

//?-----------------------------------------------------------------------------
}
