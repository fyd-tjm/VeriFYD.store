import 'package:cloud_firestore/cloud_firestore.dart';
import '../../03 domain/store/00_export_store_domain.dart';

class ProductFailureMapper {
  static ProductFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      if (error.code == 'not-found' || error.message == 'not-found') {
        return (const ProductFailure.notFound());
      } else if (error.code == 'permission-denied' ||
          error.message == 'permission-denied') {
        return (const ProductFailure.permissionDenied());
      } else {
        return (const ProductFailure.serverError());
      }
    }
    // Other Exceptions Logging
    else {
      // todo logging exceptions
      return (const ProductFailure.unexpectedError());
    }
  }
}
