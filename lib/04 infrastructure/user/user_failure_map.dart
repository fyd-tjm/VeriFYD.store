import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/analytics_service.dart';

class UserFailureMapper {
  static UserFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      // Analytics logging
      getIt<AnalyticsService>()
          .logUserException(errorMessage: error.message ?? error.code);
      // error handling
      if (error.code == 'aborted') {
        return (const UserFailure.aborted());
      } else if (error.code == 'already-exists') {
        return (const UserFailure.alreadyExists());
      } else if (error.code == 'invalid-argument') {
        return (const UserFailure.invalidArgument());
      } else if (error.code == 'not-found') {
        return (const UserFailure.notFound());
      } else if (error.code == 'permission-denied') {
        return (const UserFailure.permissionDenied());
      } else {
        return (const UserFailure.serverError());
      }
    }
    // Other Exceptions Logging
    else {
      // Analytics logging
      getIt<AnalyticsService>().logUserException(errorMessage: error.code);
      return (const UserFailure.unknownError());
    }
  }
}
