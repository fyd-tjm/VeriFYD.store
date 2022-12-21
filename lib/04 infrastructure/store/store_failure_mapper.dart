import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verifyd_store/03%20domain/store/store_failure.dart';

class StoreFailureMapper {
  static StoreFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
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
      // todo logging exceptions
      return (const StoreFailure.unexpectedError());
    }
  }
}
