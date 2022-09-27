import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/domain/auth/fyd_user.dart';
import 'package:verifyd_store/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:verifyd_store/infrastructure/auth/auth_exception_handler.dart';
import 'package:verifyd_store/infrastructure/auth/auth_failure_mapper.dart';
import 'package:verifyd_store/infrastructure/auth/firebase_user_mapper.dart';
import 'package:verifyd_store/domain/auth/i_auth_facade.dart';
import 'package:verifyd_store/domain/auth/value_objects.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthFacade(this._firebaseAuth);

  static String vId = '';
  static bool codeSentStatus = false;

  final _codeStreamController = StreamController<bool>.broadcast();
  // onCancel: () => log('Stream canceled!'),
  // onListen: () => log('Stream being listened to'),

//?-----------------Helper Methods-------------------

  void updateVerificationId(String vid) {
    vId = vid;
  }

  void updateCodeSentStatus(bool val) {
    codeSentStatus = val;
    _codeStreamController.sink.add(codeSentStatus);
  }

//?--------------------xxxxxxx-----------------------

//! Interface Override
  @override
  Stream<bool> isCodeSent() {
    final codeStream = _codeStreamController.stream;
    return codeStream;
  }

//! Interface Override
  @override
  Future<Either<AuthFailure, Unit>> sendOtp(
      {required PhoneNumber phoneNumber}) async {
    final phoneNumberStr = phoneNumber.getOrCrash();
    updateCodeSentStatus(false);
    updateVerificationId('');

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumberStr',
        timeout: const Duration(milliseconds: 60000),
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificaitonfailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

//? -----------------Helper Methods of above Override--------------

  // Function Callback when an SMS is auto-retrieved or the phone number has been instantly verified
  void _verificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      AuthExceptionHandler.handleException(e);
    }
  }

// Function Callback when an error occurred during phone number verification
  void _verificaitonfailed(FirebaseAuthException e) {
    AuthExceptionHandler.handleException(e);
  }

// Function Callback after code is sent and vid and token is generated
  void _codeSent(String verificationId, int? resendToken) {
    updateVerificationId(verificationId);
    updateCodeSentStatus(true);
  }

//? --------------------------xxxxxxxx --------------------------------

//! Interface Override
  @override
  Future<Either<AuthFailure, Unit>> confirmOtp({required Otp otp}) async {
    final otpStr = otp.getOrCrash();
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: vId, smsCode: otpStr);
    try {
      await _firebaseAuth.signInWithCredential(credential);
      return right(unit);
    } catch (e) {
      return left(AuthFailureMapper.failureMapper(e));
    }
  }

//! Interface Override
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

//! Interface Override
  @override
  Stream<FydUser?> onChangeUserStream() {
    final userStream = _firebaseAuth.userChanges().map<FydUser?>(
          (firebaseUser) => firebaseUser?.toDomain(),
        );
    return userStream;
  }

//! Interface Override
  @override
  FydUser? getCurrentUser() {
    final fydUser = _firebaseAuth.currentUser?.toDomain();
    return fydUser;
  }

//! To create User document after recieving userName
  @override
  Future<Either<AuthFailure, Unit>> addUserName(
      {required UserName userName}) async {
    try {
      await _firebaseAuth.currentUser!.updateDisplayName(userName.getOrCrash());
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.firebaseAuthError());
    }
  }
}
