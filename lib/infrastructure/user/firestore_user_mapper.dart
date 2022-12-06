import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:verifyd_store/domain/user/fyd_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:verifyd_store/domain/auth/auth_user.dart';

extension FirebaseUserDomainX on firebase.User {
  AuthUser toAuthUser() {
    return AuthUser(
      userId: uid,
      userPhone: phoneNumber!,
    );
  }
}

extension FirestoreDomainX on firestore.DocumentSnapshot {
  FydUser toFydUser() {
    return FydUser(uId: get('uId'), phone: get('phone'), name: get('name'));
  }
}
