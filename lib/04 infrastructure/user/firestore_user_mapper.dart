import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:verifyd_store/04%20infrastructure/core/firebase_helper.dart';

import '../../03 domain/user/fyd_user.dart';

extension FirestoreDomainX on firestore.DocumentSnapshot {
  FydUser toFydUser() {
    return FydUser(
      uId: get(DbFKeys.userId()),
      name: get(DbFKeys.userName()),
      phone: get(DbFKeys.userPhone()),
      email: get(DbFKeys.userEmail()),
      addresses: get(DbFKeys.userAddress()),
    );
  }
}
