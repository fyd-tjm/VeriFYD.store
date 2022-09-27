import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/auth/auth_failure.dart';
import 'package:verifyd_store/domain/auth/fyd_user.dart';

import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> sendOtp({required PhoneNumber phoneNumber});

  Stream<bool> isCodeSent();

  Future<Either<AuthFailure, Unit>> confirmOtp({required Otp otp});

  Future<void> signOut();

  FydUser? getCurrentUser();

  Stream<FydUser?> onChangeUserStream();

  Future<Either<AuthFailure, Unit>> addUserName({required UserName userName});
}
