import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/auth/auth_user.dart';
import 'package:verifyd_store/domain/user/fyd_user.dart';
import 'package:verifyd_store/domain/user/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> createUser({required FydUser fydUser});

  Future<Tuple2<AuthUser?, FydUser?>> getFydUser();

  Future<void> logOutUser();
}
