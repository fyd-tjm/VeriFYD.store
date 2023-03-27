import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verifyd_store/03%20domain/shared/shared_info_failure.dart';

class SharedInfoFailureMapper {
  static SharedInfoFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      if (error.code == 'not-found' || error.message == 'not-found') {
        return (const SharedInfoFailure.notFound());
      } else if (error.code == 'permission-denied' ||
          error.message == 'permission-denied') {
        return (const SharedInfoFailure.permissionDenied());
      } else {
        return (const SharedInfoFailure.serverError());
      }
    } else {
      return (const SharedInfoFailure.unexpectedError());
    }
  }
}
