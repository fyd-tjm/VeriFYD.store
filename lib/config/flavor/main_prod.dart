import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:verifyd_store/utils/dependency%20injections/injection.dart';
import '../../presentation/core/views/start_app.dart';
import '../app_config.dart';
import '../firebase/prod/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const configuredApp = AppConfig(
    environment: Env.dev,
    appTitle: 'verifyd.store',
    child: StartApp(),
  );
  configureInjection(Environment.prod);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(configuredApp));
}
