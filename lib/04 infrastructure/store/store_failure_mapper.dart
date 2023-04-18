import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

class StoreFailureMapper {
  static StoreFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logStoreException(errorMessage: error.message ?? error.code);
      // error handling
      if (error.code == 'not-found' || error.message == 'not-found') {
        return (const StoreFailure.notFound());
      } else if (error.code == 'permission-denied' ||
          error.message == 'permission-denied') {
        return (const StoreFailure.permissionDenied());
      } else {
        return (const StoreFailure.serverError());
      }
    }
    // Other Exceptions Logging
    else {
      // Analytics logging
      getIt<AnalyticsService>()
          .logStoreException(errorMessage: error.toString());
      return (const StoreFailure.unexpectedError());
    }
  }
}
