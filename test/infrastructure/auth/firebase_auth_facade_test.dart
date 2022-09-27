// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:verifyd_store/infrastructure/auth/firebase_auth_facade.dart';

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// void main() {
//   // ignore: unused_local_variable
//   late FirebaseAuthFacade sut;
//   late MockFirebaseAuth mockFirebaseAuth;

//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     sut = FirebaseAuthFacade(mockFirebaseAuth);
//   });

//   test(
//     "static variables are correct",
//     () async {
//       // Assert
//       expect(FirebaseAuthFacade.codeSentStatus, false);
//       expect(FirebaseAuthFacade.vId, "");
//     },
//   );

//   test(
//     "isCodeSent Stream working",
//     () async {
//       // Arrange
//       late StreamSubscription<bool> streamSubscription;
//       // Act
//       final stream = sut.isCodeSent();
//       streamSubscription = stream.listen((event) {});
//       sut.updateCodeSentStatus(true);

//       // Assert
//       streamSubscription.onData((data) {
//         expect(FirebaseAuthFacade.codeSentStatus, true);
//       });
//     },
//   );
//   group('sendOtp method is working', () {
//     test(
//       "number validation",
//       () async {
//         // Arrange

//         // Act

//         // Assert
//       },
//     );
//   });
// }
