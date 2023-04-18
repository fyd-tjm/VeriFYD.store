import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/cart/cart_failure.dart';
import 'package:verifyd_store/03%20domain/cart/i_cart_repository.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

@LazySingleton(as: ICartRepository)
class FirebaseCartRepository implements ICartRepository {
//?-----------------------------------------------------------------------------
  final FirebaseFirestore _firestore;
  FirebaseCartRepository(this._firestore);

//?--Get-Cart-RealTime----------------------------------------------------------
  @override
  Stream<Either<CartFailure, Cart>> getCartRealtime() async* {
    final cartRef = DbRef.getCartRef();
    final cartDoc = _firestore.doc(cartRef).withConverter<Cart>(
        fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    yield* cartDoc.snapshots().map((cartSnapshot) {
      return right<CartFailure, Cart>(cartSnapshot.data()!);
    }).onErrorReturnWith((error, stackTrace) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logCartException(errorMessage: error.toString());

      return left(const CartFailure.cartStreamFailure());
    });
  }

//?--Add-New-Cart---------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> addNewCart({required Cart cart}) async {
    final cartRef = DbRef.getCartRef();
    final cartDoc = _firestore.doc(cartRef).withConverter<Cart>(
        fromFirestore: (snapshot, _) => Cart.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());

    final result = await cartDoc
        .set(cart)
        .then((value) => right<CartFailure, Unit>(unit))
        .onError((error, stackTrace) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logCartException(errorMessage: error.toString());
      return left(const CartFailure.updateCartFailure());
    });

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Add-New-Sku----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> addNewProduct(
      {required String skuId, required Map<String, int> sizeQty}) async {
    final cartRef = DbRef.getCartRef();
    final docRef = _firestore.doc(cartRef);

    final result = await docRef
        .set({
          DbFKeys.cartItems(): {
            skuId: {sizeQty.keys.first: sizeQty.values.first}
          },
          DbFKeys.cartCount(): FieldValue.increment(1),
        }, SetOptions(merge: true))
        .then((value) => right<CartFailure, Unit>(unit))
        .onError((error, stackTrace) {
          // Analytics logging
          getIt<AnalyticsService>()
              .logCartException(errorMessage: error.toString());
          return left(const CartFailure.updateCartFailure());
        });
    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Update-Size----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> updateSize(
      {required String skuId,
      required String size,
      required int updateBy}) async {
    final cartRef = DbRef.getCartRef();
    final docRef = _firestore.doc(cartRef);

    final result = await docRef
        .update(
          {
            '${DbFKeys.cartItems()}.$skuId.$size':
                FieldValue.increment(updateBy),
            DbFKeys.cartCount(): FieldValue.increment(updateBy),
          },
        )
        .then((value) => right<CartFailure, Unit>(unit))
        .onError((error, stackTrace) {
          // Analytics logging
          getIt<AnalyticsService>()
              .logCartException(errorMessage: error.toString());
          return left(const CartFailure.updateCartFailure());
        });

    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Remove-Size----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> removeSize(
      {required String skuId,
      required String size,
      required int removedQty}) async {
    final cartRef = DbRef.getCartRef();
    final docRef = _firestore.doc(cartRef);

    final result = await docRef
        .update(
          {
            '${DbFKeys.cartItems()}.$skuId.$size': FieldValue.delete(),
            DbFKeys.cartCount(): FieldValue.increment(-removedQty),
          },
        )
        .then((value) => right<CartFailure, Unit>(unit))
        .onError((error, stackTrace) {
          // Analytics logging
          getIt<AnalyticsService>()
              .logCartException(errorMessage: error.toString());
          return left(const CartFailure.updateCartFailure());
        });
    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?--Clear-Cart-----------------------------------------------------------------
  @override
  Future<Either<CartFailure, Unit>> clearCart() async {
    final cartRef = DbRef.getCartRef();
    final docRef = _firestore.doc(cartRef);

    final result = await docRef
        .update(Cart.initial().toJson())
        .then((value) => right<CartFailure, Unit>(unit))
        .onError((error, stackTrace) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logCartException(errorMessage: error.toString());
      return left(const CartFailure.updateCartFailure());
    });
    return result.fold(
      (failure) => left(failure),
      (r) => right(unit),
    );
  }

//?-----------------------------------------------------------------------------
}
