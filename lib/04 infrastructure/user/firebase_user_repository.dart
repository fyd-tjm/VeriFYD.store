import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/04%20infrastructure/user/user_failure_map.dart';

@LazySingleton(as: IUserRepository)
class FirebaseUserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;
  FirebaseUserRepository(this._firestore);

//?-----------------------------------------------------------------------------
  late final fydUserCollectionRef = _firestore
      .usersCollection()
      .withConverter<FydUser>(
          fromFirestore: (snapshot, _) => FydUser.fromJson(snapshot.data()!),
          toFirestore: (fydUser, _) => fydUser.toJson());

//?-Create-User-----------------------------------------------------------------
  @override
  Future<Either<UserFailure, Unit>> createUser({
    required String name,
    required String email,
  }) async {
    try {
      // create fydUser
      final fydUser = FydUser(
        uId: DbRef.getUserId(),
        phone: FirebaseAuth.instance.currentUser!.phoneNumber!,
        name: name,
        email: email,
        addresses: const {},
      );
      await fydUserCollectionRef.doc(fydUser.uId).set(fydUser);
      await _firestore.doc(DbRef.getCartRef()).set(Cart.initial().toJson());
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      return right(unit);
    } catch (e) {
      // error handling
      return left(UserFailureMapper.failureMapper(e));
    }
  }

//?-FydUser-In-Realtime---------------------------------------------------------
  @override
  Stream<Either<UserFailure, FydUser?>> getFydUserRealtime() async* {
    final userDoc = fydUserCollectionRef.doc(DbRef.getUserId());

    yield* userDoc.snapshots().map((userSnapshot) {
      return right<UserFailure, FydUser?>(userSnapshot.data());
    }).onErrorReturnWith((error, stackTrace) {
      return left(UserFailureMapper.failureMapper(error));
    });
  }

//?-FydUser-In-Realtime---------------------------------------------------------
  @override
  Future<Either<UserFailure, Unit>> updateProfile(
      {required String? name, required String? email}) async {
    var userDoc = _firestore.usersCollection().doc(DbRef.getUserId());
    // updating Values condition check
    if (name == null && email == null) {
      // failure -- invalid argument
      return left(const UserFailure.invalidArgument());
    } else {
      final Object? updateData;
      if (name != null && email != null) {
        // update both
        updateData = {DbFKeys.userName(): name, DbFKeys.userEmail(): email};
      } else {
        if (name == null) {
          // update email
          updateData = {DbFKeys.userEmail(): email};
        } else {
          // update name
          updateData = {
            DbFKeys.userName(): name,
          };
        }
      }
      final result = await userDoc
          .set(updateData, SetOptions(merge: true))
          .then((value) {
        return right(unit);
      }).onError((error, stackTrace) =>
              left(UserFailureMapper.failureMapper(error)));

      return result.fold(
        (userFailure) => left(userFailure),
        (success) => right(success),
      );
    }
  }

//?-New-Address-----------------------------------------------------------------
  @override
  Future<Either<UserFailure, Unit>> addNewAddress(
      {required FydAddress address, required int newIndex}) async {
    var userDoc = _firestore.usersCollection().doc(DbRef.getUserId());

    var result = await userDoc.set({
      DbFKeys.userAddress(): {newIndex.toString(): address.toJson()}
    }, SetOptions(merge: true)).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(UserFailureMapper.failureMapper(error)));

    return result.fold(
      (userFailure) => left(userFailure),
      (success) => right(success),
    );
  }

//?-Update-Address--------------------------------------------------------------
  @override
  Future<Either<UserFailure, Unit>> updateAddress(
      {required FydAddress address, required int atIndex}) async {
    //! for-testing

    var userDoc = _firestore.usersCollection().doc(DbRef.getUserId());

    var result = await userDoc.update(
      {'${DbFKeys.userAddress()}.$atIndex': address.toJson()},
    ).then((value) {
      return right(unit);
    }).onError(
        (error, stackTrace) => left(UserFailureMapper.failureMapper(error)));

    return result.fold(
      (userFailure) => left(userFailure),
      (success) => right(success),
    );
  }

//?-Log-Out-User----------------------------------------------------------------
  @override
  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

//?-----------------------------------------------------------------------------
  @override
  Future<Either<UserFailure, List<FydOrder>>> getOrders(
      {required String userId}) async {
    final ordersCollectionRef = _firestore
        .ordersCollection()
        .withConverter<FydOrder>(
            fromFirestore: (snapshot, _) => FydOrder.fromJson(snapshot.data()!),
            toFirestore: (fydOrder, _) => fydOrder.toJson());
    try {
      final ordersList = await ordersCollectionRef
          .where('${DbFKeys.orderCustomerInfo()}.${DbFKeys.orderCustomerId()}',
              isEqualTo: userId)
          .orderBy(DbFKeys.orderDate(), descending: true)
          .get()
          .then(
              (qSnap) => qSnap.docs.map((docSnap) => docSnap.data()).toList());
      return right(ordersList);
    } catch (e) {
      return left(UserFailureMapper.failureMapper(e));
    }
  }

//?-----------------------------------------------------------------------------
}
