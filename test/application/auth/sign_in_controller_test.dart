// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:verifyd_store/application/auth/sign_in_controller.dart';
// import 'package:verifyd_store/domain/auth/value_objects.dart';
// import 'package:verifyd_store/infrastructure/auth/firebase_auth_facade.dart';

// class MockIAuthFacade extends Mock implements FirebaseAuthFacade {}

// void main() {
//   late SignInController sut;
//   late MockIAuthFacade mockIAuthFacade;

//   setUp(() {
//     mockIAuthFacade = MockIAuthFacade();
//     sut = SignInController(mockIAuthFacade);
//   });

//   group('Send Otp is Pressed', () {
//     void arrangePhoneNumber() {
//       sut.phoneNumber.value = PhoneNumber('9690590179');
//     }

//     void arrangeIAuthFacade() {
//       when(() => mockIAuthFacade.sendOtp(phoneNumber: sut.phoneNumber.value))
//           .thenAnswer((_) async => right(unit));
//     }

//     test(
//       "initial values are correct",
//       () async {
//         expect(sut.phoneNumber.value, PhoneNumber(''));
//         expect(sut.otp.value, Otp(''));
//         // expect(sut.isCodeSent.value, false);
//       },
//     );

//     test(
//       " phone number validation working ",
//       () async {
//         // Arrange
//         arrangePhoneNumber();
//         // Act
//         sut.sendOtpPressed();
//         // Assert
//         expect(sut.phoneNumber.value.isValid(), true);
//       },
//     );
//   });
// }
