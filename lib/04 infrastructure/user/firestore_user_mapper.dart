import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../03 domain/auth/auth_user.dart';
import '../../03 domain/user/fyd_user.dart';

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
    return FydUser(
      uId: get('uId'),
      phone: get('phone'),
      email: get('email'),
      name: get('name'),
      cartRef: get('cartRef'),
      ordersRef: get('ordersRef'),
      addresses: get('addresses'),
    );
  }
}
