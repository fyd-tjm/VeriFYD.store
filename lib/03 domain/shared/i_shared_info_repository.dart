import 'package:dartz/dartz.dart';
import '00_export_shared_domain.dart';

abstract class ISharedInfoRepository {
  // get shared-user-info like { categories, liveStores, shippingCost, coupons, banners.... }
  Stream<Either<SharedInfoFailure, SharedInfo>> getSharedInfo();
}
