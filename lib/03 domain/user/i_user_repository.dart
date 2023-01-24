import 'package:dartz/dartz.dart';
import 'package:verifyd_store/03%20domain/checkout/order.dart';
import 'package:verifyd_store/03%20domain/user/address.dart';

import '../auth/00_export_auth_domain.dart';
import '00_export_user_domain.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> createUser({required String name});

  Future<Tuple2<AuthUser?, FydUser?>> getFydUser();

  Future<void> logOutUser();

  Stream<Either<UserFailure, FydUser>> getFydUserRealtime();

  Future<Either<UserFailure, Unit>> updateProfile(
      {required String? name, required String? email});

  Future<Either<UserFailure, Unit>> updateAddress(
      {required FydAddress address, required int atIndex});

  Future<Either<UserFailure, Unit>> addNewAddress(
      {required FydAddress address, required int newIndex});

  Future<Either<UserFailure, List<FydOrder>>> getOrders(
      {required String userId});
}
