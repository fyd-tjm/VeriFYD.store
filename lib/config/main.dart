import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/services/crashylitics_service.dart';
import 'package:verifyd_store/utils/services/dynamic_link_services.dart';

import '../01 presentation/00 core/start_app.dart';
import 'app_config.dart';

//?-----------------------------------------------------------------------------
//! Switches
const bool useEmulator = false;
const bool useDebugMode = true;
//?-----------------------------------------------------------------------------
void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      // Bloc-Observer
      if (useDebugMode) Bloc.observer = MyGlobalObserver();

      // dependency-injecetion
      configureInjection();

      // crashlytics
      await getIt<CrashyliticsService>().setUserId();
      getIt<CrashyliticsService>().recordFlutterError();

      // handle dynamic links
      await getIt<DynamicLinkService>().handleDynamicLinks();

      // local-db
      await Hive.initFlutter();
      await Hive.openBox('local-db');

      // Firebase-Emulator
      if (useEmulator) {
        await _connectToFirebaseEmulator();
      }

      // Flavor-Config
      final configuredApp = AppConfig(
        environment: Env.dev, // Env.prod
        appTitle: '[DEV] verifyd.store', // 'verifyd.store'
        child: StartApp(useDebugMode: useDebugMode),
      );

      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      ).then((value) => runApp(configuredApp));
    },
    (error, stack) => getIt<CrashyliticsService>().recordError(error, stack),
  );
}

//?-----------------------------------------------------------------------------
Future _connectToFirebaseEmulator() async {
  String host = "192.168.29.231"; // for real device
  String functionHost = "10.0.2.2";
  FirebaseFirestore.instance.settings = Settings(
    host: '$host:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  FirebaseFunctions.instance.useFunctionsEmulator(functionHost, 5001);
  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
}

//?-----------------------------------------------------------------------------
// bloc observer
class MyGlobalObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent Bloc-- ${bloc.runtimeType} -- ${event.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange Bloc type-- ${bloc.runtimeType} ');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError Bloc-- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }
}

//?-----------------------------------------------------------------------------
