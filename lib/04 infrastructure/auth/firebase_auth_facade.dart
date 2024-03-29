import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../03 domain/auth/00_export_auth_domain.dart';
import 'auth_failure_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
//?-----------------------------------------------------------------------------

  final FirebaseAuth _firebaseAuth;
  FirebaseAuthFacade(this._firebaseAuth);
//?-----------------------------------------------------------------------------

  String? verificationId;
  void _updateVerficationId(String? value) {
    verificationId = value;
  }
//?-----------------------------------------------------------------------------

//! Interface Override SEND-OTP
  @override
  Stream<Either<AuthFailure, Unit>> sendOtp({
    required PhoneNumber phoneNumber,
  }) async* {
    final streamController = StreamController<Either<AuthFailure, Unit>>();
    // update vid to null
    _updateVerficationId(null);
    // call verifyPhone via firebaseAuth
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber.getOrCrash()}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          //? Android Only!
          await _firebaseAuth.signInWithCredential(credential);
          // close Stream controller
          streamController.close();
        },
        codeSent: (String verificationId, int? resendToken) async {
          // update vid for this session
          _updateVerficationId(verificationId);
          // add true to stream
          streamController.add(right<AuthFailure, Unit>(unit));
          // close Stream controller
          streamController.close();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        verificationFailed: (FirebaseAuthException e) {
          late final AuthFailure failure;
          failure = AuthFailureMapper.mapException(e);
          // add failure to stream
          streamController.add(left(failure));
          // close Stream controller
          streamController.close();
        });
    yield* streamController.stream;
  }

//?-----------------------------------------------------------------------------
//! Interface Override CONFIRM-OTP
  @override
  Future<Either<AuthFailure, Unit>> confirmOtp({
    required Otp otp,
  }) async {
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
              verificationId: verificationId!, smsCode: otp.getOrCrash());

      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return right(unit);
    } catch (e) {
      return left(AuthFailureMapper.mapException(e));
    }
  }

//?-----------------------------------------------------------------------------
//! Interface Override SIGN-OUT
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
//?-----------------------------------------------------------------------------

//! Interface Override GET-CURRENT-USER
  @override
  bool getAuthStatus() {
    final authStatus = (_firebaseAuth.currentUser == null) ? false : true;
    return authStatus;
  }

//?-----------------------------------------------------------------------------

//! Interface Override Check-Onboard-status
  @override
  bool getOnBoardStatus() {
    final status = (_firebaseAuth.currentUser!.displayName == null)
        ? false
        : ((_firebaseAuth.currentUser!.displayName!.isEmpty) ? false : true);
    return status;
  }
//?-----------------------------------------------------------------------------
}
