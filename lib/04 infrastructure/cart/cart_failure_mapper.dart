import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verifyd_store/03%20domain/user/00_export_user_domain.dart';

import '../../03 domain/cart/cart_failure.dart';

// class CartFailureMapper {
//   static CartFailure failureMapper(error) {
//     // Firestore Exceptions
//     if (error is FirebaseException) {
//       if (error.code == 'aborted') {
//         return (const CartFailure.aborted());
//       } else if (error.code == 'already-exists') {
//         return (const CartFailure.alreadyExists());
//       } else if (error.code == 'invalid-argument') {
//         return (const CartFailure.invalidArgument());
//       } else if (error.code == 'not-found') {
//         return (const CartFailure.notFound());
//       } else if (error.code == 'permission-denied') {
//         return (const CartFailure.permissionDenied());
//       } else {
//         return (const CartFailure.serverError());
//       }
//     }
//     // Other Exceptions Logging
//     else {
//       // todo logging exceptions
//       return (const CartFailure.unknownError());
//     }
//   }
// }
