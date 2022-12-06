import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/auth/00_export_auth_domain.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';
import 'package:verifyd_store/04%20infrastructure/user/firestore_user_mapper.dart';
import 'package:verifyd_store/04%20infrastructure/user/user_failure_map.dart';
import 'user_failure_map.dart';

@LazySingleton(as: IUserRepository)
class FirebaseUserRepository implements IUserRepository {
  final FirebaseFirestore _firestore;
  FirebaseUserRepository(this._firestore);

  late final fydUserCollectionRef = _firestore
      .usersCollection()
      .withConverter<FydUser>(
          fromFirestore: (snapshot, _) => FydUser.fromJson(snapshot.data()!),
          toFirestore: (fydUser, _) => fydUser.toJson());

  @override
  Future<Either<UserFailure, Unit>> createUser(
      {required FydUser fydUser}) async {
    try {
      // update currentUser displayName
      await FirebaseAuth.instance.currentUser!.updateDisplayName(fydUser.name);
      // create userDoc with id as uid
      await fydUserCollectionRef.doc(fydUser.uId).set(fydUser);
      return right(unit);
    } catch (e) {
      // error handling
      return left(UserFailureMapper.failureMapper(e));
    }
  }

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

  @override
  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
