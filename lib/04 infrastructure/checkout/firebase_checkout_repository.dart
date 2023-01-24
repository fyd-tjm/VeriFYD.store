import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/03%20domain/checkout/checkout_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/checkout/i_checkout_repository.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/04 infrastructure/core/firebase_helper.dart';

@LazySingleton(as: ICheckoutRepository)
class FirebaseCheckoutRepository implements ICheckoutRepository {
//?-----------------------------------------------------------------------------
  final FirebaseFirestore _firestore;
  FirebaseCheckoutRepository(this._firestore);
//?-----------------------------------------------------------------------------
  //! Create-Order
  @override
  Future<Either<CheckoutFailure, Unit>> createOrder(
      {required FydOrder fydOrder}) async {
    //------
    final ordersRef = _firestore.ordersCollection().withConverter<FydOrder>(
        fromFirestore: (snapshot, _) => FydOrder.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());
    //------
    final result =
        await ordersRef.doc(fydOrder.orderId).set(fydOrder).then((value) async {
      await updateSharedInfo();
      return right<CheckoutFailure, Unit>(unit);
    }).onError((error, stackTrace) => left(
              CheckoutFailure.createOrderFailure(fydOrder: fydOrder),
            ));
    //---------
    return result.fold(
      (failure) => (left(failure)),
      (success) => (right(success)),
    );
  }

//?-----------------------------------------------------------------------------
  Future<Either<CheckoutFailure, Unit>> updateSharedInfo() async {
    //------
    final idsDoc = _firestore.doc(DbRef.getSharedInfoUserRef());
    //------
    final result = await idsDoc
        .set({DbFKeys.sharedInfoTotalOrders(): FieldValue.increment(1)},
            SetOptions(merge: true))
        .then((snapshot) => right(unit))
        .onError((error, stackTrace) {
          return left(const CheckoutFailure.unexpectedFailure(null));
        });
    //------
    return result.fold(
      (failure) {
        return left(failure);
      },
      (success) => right(success),
    );
    //------
  }

//?-----------------------------------------------------------------------------
  //! Get-OrderId
  @override
  Future<Either<CheckoutFailure, String>> getOrderId(
      {required int orderNumber}) async {
    //------
    final idsDoc = _firestore.doc(DbRef.getSharedInfoOrderIdsRef());
    //------
    final result = await idsDoc
        .get()
        .then((snapshot) => right(snapshot.get('ids')[orderNumber]))
        .onError((error, stackTrace) => left(
              CheckoutFailure.orderIdFailure(
                  orderNumber: orderNumber.toString()),
            ));
    //------
    return result.fold(
      (failure) => left(failure),
      (success) => right(success),
    );
    //------
  }
//?-----------------------------------------------------------------------------
}
