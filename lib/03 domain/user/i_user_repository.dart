import 'package:dartz/dartz.dart';

import '../auth/00_export_auth_domain.dart';
import '00_export_user_domain.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> createUser({required FydUser fydUser});

  Future<Tuple2<AuthUser?, FydUser?>> getFydUser();

  Future<void> logOutUser();
}
