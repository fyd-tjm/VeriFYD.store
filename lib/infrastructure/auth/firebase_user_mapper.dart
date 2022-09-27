import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:verifyd_store/domain/auth/fyd_user.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';
import 'package:verifyd_store/domain/core/value_object.dart';

extension FirebaseUserDomainX on firebase.User {
  FydUser toDomain() {
    return FydUser(
      uId: UniqueId.fromUniqueString(uid),
      userPhoneNumber: PhoneNumber.fromDb(phoneNumber!),
      userName: (displayName == null) ? null : UserName.fromDb(displayName!),
    );
  }
}
