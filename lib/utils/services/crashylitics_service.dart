import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CrashyliticsService {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  // setting userId
  Future<void> setUserId() async {
    await _crashlytics.setUserIdentifier(
        FirebaseAuth.instance.currentUser?.uid ?? 'logged-out');
  }

  // For all errors inside the main()
  void recordFlutterError() async {
    FlutterError.onError = _crashlytics.recordFlutterError;
  }

  // For all errors outside the main()
  void recordError(dynamic error, dynamic stack) {
    setUserId();
    _crashlytics.recordError(error, stack);
  }

  // For testing-crash
  void crash() {
    _crashlytics.crash();
  }
}
