import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:verifyd_store/start_app.dart';
import '../app_config.dart';
import '../firebase/dev/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const configuredApp = AppConfig(
    environment: Environment.dev,
    appTitle: '[DEV] verifyd.store',
    child: StartApp(),
  );

  runApp(configuredApp);
}
