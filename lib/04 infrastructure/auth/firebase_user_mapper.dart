import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../../03 domain/auth/auth_user.dart';

extension FirebaseUserDomainX on firebase.User {
  AuthUser toDomain() {
    return AuthUser(
      userId: uid,
      userPhone: phoneNumber!,
    );
  }
}
