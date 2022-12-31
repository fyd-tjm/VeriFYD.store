import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verifyd_store/03%20domain/auth/00_export_auth_domain.dart';
import 'package:verifyd_store/03%20domain/cart/cart.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/04%20infrastructure/user/firestore_user_mapper.dart';
import 'package:verifyd_store/04%20infrastructure/user/user_failure_map.dart';
import 'user_failure_map.dart';

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
  Future<Either<UserFailure, Unit>> createUser({required String name}) async {
    try {
      // update currentUser displayName
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      // create userDoc with id as uid
      // create fydUser
      final fydUser = FydUser(
        uId: FirebaseAuth.instance.currentUser!.uid,
        phone: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        name: FirebaseAuth.instance.currentUser!.displayName!,
        email: '',
        addresses: const {},
        cartRef: '',
        ordersRef: 'users/${FirebaseAuth.instance.currentUser!.uid}/orders',
      );
      await fydUserCollectionRef.doc(fydUser.uId).set(fydUser);
      final cartDocRef = await _firestore
          .collection('users/${FirebaseAuth.instance.currentUser!.uid}/cart')
          .add(Cart.initial().toJson());
      await _firestore
          .doc(fydUser.uId)
          .set({'cartRef': cartDocRef}, SetOptions(merge: true));
      return right(unit);
    } catch (e) {
      // error handling
      return left(UserFailureMapper.failureMapper(e));
    }
  }

//?-LogOut-User-----------------------------------------------------------------
  @override
  Future<Tuple2<AuthUser?, FydUser?>> getFydUser() async {
    final authUser = FirebaseAuth.instance.currentUser?.toAuthUser();
    if (authUser == null) return const Tuple2(null, null);
    FydUser? fydUser;
    try {
      fydUser = await _firestore
          .usersCollection()
          .doc(authUser.userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          return documentSnapshot.toFydUser();
        } else {
          return null;
        }
      });
    } catch (e) {
      //todo error Handling
    }
    return Tuple2(authUser, fydUser);
  }

//?-FydUser-In-Realtime---------------------------------------------------------
  @override
  Stream<Either<UserFailure, FydUser>> getFydUserRealtime() async* {
    //! for-testing
    const uId =
        '6yQEkmtw9uIed83psnEpkt6rw6AV'; // FirebaseAuth.instance.currentUser!.uid;

    final userDoc = fydUserCollectionRef.doc(uId);

    yield* userDoc.snapshots().map((userSnapshot) {
      return right<UserFailure, FydUser>(userSnapshot.data()!);
    }).onErrorReturnWith((error, stackTrace) {
      log("fydRealtime-REPO: ${error.toString()}");
      return left(UserFailureMapper.failureMapper(error));
    });
  }

//?-FydUser-In-Realtime---------------------------------------------------------
  @override
  Future<Either<UserFailure, Unit>> updateProfile(
      {required String? name, required String? email}) async {
    //! for-testing
    const uId =
        '6yQEkmtw9uIed83psnEpkt6rw6AV'; //FirebaseAuth.instance.currentUser!.uid;
    var userDoc = _firestore.usersCollection().doc(uId);
    // updating Values condition check
    if (name == null && email == null) {
      // failure -- invalid argument
      return left(const UserFailure.invalidArgument());
    } else {
      final Object? updateData;
      if (name != null && email != null) {
        // update both
        updateData = {'name': name, 'email': email};
      } else {
        if (name == null) {
          // update email
          updateData = {'email': email};
        } else {
          // update name
          updateData = {
            'name': name,
          };
        }
      }
      var result = await userDoc.set(updateData, SetOptions(merge: true)).then(
          (value) {
        return right(unit);
      }).onError(
          (error, stackTrace) => left(UserFailureMapper.failureMapper(error)));

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
    //! for-testing
    const uId =
        '6yQEkmtw9uIed83psnEpkt6rw6AV'; //FirebaseAuth.instance.currentUser!.uid;
    var userDoc = _firestore.usersCollection().doc(uId);

    var result = await userDoc.set({
      'addresses': {newIndex.toString(): address.toJson()}
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
    const uId =
        '6yQEkmtw9uIed83psnEpkt6rw6AV'; //FirebaseAuth.instance.currentUser!.uid;
    var userDoc = _firestore.usersCollection().doc(uId);
    final index = atIndex.toString();
    var result = await userDoc.update(
      {'addresses.$index': address.toJson()},
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

}
