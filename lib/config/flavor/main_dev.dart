import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import 'package:verifyd_store/utils/router.gr.dart';
import '../../01 presentation/00 core/start_app.dart';
import '../app_config.dart';
import '../firebase/dev/firebase_options.dart';

//?-----------------------------------------------------------------------------
//! Emulator-Switch
const bool useEmulator = true;
//?-----------------------------------------------------------------------------
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //! Firebase-Emulator
  if (useEmulator) {
    await _connectToFirebaseEmulator();
  }
  //! Bloc-Observer
  Bloc.observer = MyGlobalObserver();

  //! Flavor-Config
  final configuredApp = AppConfig(
    environment: Env.dev,
    appTitle: '[DEV] verifyd.store',
    child: StartApp(),
  );
  configureInjection(Environment.dev);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(configuredApp));
}

//?-----------------------------------------------------------------------------
Future _connectToFirebaseEmulator() async {
  String host = "192.168.29.231"; // for real device
  FirebaseFirestore.instance.settings = Settings(
    host: '$host:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  await FirebaseAuth.instance.useAuthEmulator(host, 9099);
}
//?-----------------------------------------------------------------------------