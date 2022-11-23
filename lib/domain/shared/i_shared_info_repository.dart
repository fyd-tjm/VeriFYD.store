import 'package:dartz/dartz.dart';
import 'package:verifyd_store/domain/shared/shared_info.dart';
import 'package:verifyd_store/domain/shared/shared_info_failure.dart';

abstract class ISharedInfoRepository {
  // get shared-user-info like { categories, liveStores, shippingCost, coupons, banners.... }
  Stream<Either<SharedInfoFailure, SharedInfo>> getSharedInfo();
}
