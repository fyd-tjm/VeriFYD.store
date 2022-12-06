import 'package:dartz/dartz.dart';
import '00_export_auth_domain.dart';

abstract class IAuthFacade {
  Stream<Either<AuthFailure, bool>> sendOtp({required PhoneNumber phoneNumber});

  Future<Either<AuthFailure, Unit>> confirmOtp({required Otp otp});

  Future<void> signOut();

  AuthUser? getCurrentUser();
}
