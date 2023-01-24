import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/03%20domain/checkout/checkout_failures.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';

class CheckoutFailureMapper {
  static CheckoutFailure failureMapper(error) {
    // Firestore Exceptions
    if (error is FirebaseException) {
      return (CheckoutFailure.unexpectedFailure(error.code));
    }
    // Other Exceptions Logging
    else {
      return (CheckoutFailure.unexpectedFailure(error.toString()));
    }
  }
}
