import 'package:cloud_firestore/cloud_firestore.dart';

import '../../03 domain/shared/00_export_shared_domain.dart';

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
    }
    // Other Exceptions Logging
    else {
      // todo logging exceptions
      return (const SharedInfoFailure.unexpectedError());
    }
  }
}
