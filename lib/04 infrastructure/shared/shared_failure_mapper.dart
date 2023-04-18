import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verifyd_store/03%20domain/shared/shared_info_failure.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

class SharedInfoFailureMapper {
  static SharedInfoFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logSharedInfoException(errorMessage: error.message ?? error.code);
      // error handling
      if (error.code == 'not-found' || error.message == 'not-found') {
        return (const SharedInfoFailure.notFound());
      } else if (error.code == 'permission-denied' ||
          error.message == 'permission-denied') {
        return (const SharedInfoFailure.permissionDenied());
      } else {
        return (const SharedInfoFailure.serverError());
      }
    } else {
      // Analytics logging
      getIt<AnalyticsService>()
          .logSharedInfoException(errorMessage: error.toString());
      return (const SharedInfoFailure.unexpectedError());
    }
  }
}
