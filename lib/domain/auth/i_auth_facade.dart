import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/auth/auth_failure.dart';
import 'package:verifyd_store/domain/auth/auth_user.dart';
import 'package:verifyd_store/domain/user/fyd_user.dart';

import 'value_objects.dart';

abstract class IAuthFacade {
  Stream<Either<AuthFailure, bool>> sendOtp({required PhoneNumber phoneNumber});

  Future<Either<AuthFailure, Unit>> confirmOtp({required Otp otp});

  Future<void> signOut();

  AuthUser? getCurrentUser();

  Stream<FydUser?> onAuthStateChanges();
}
