import 'package:flutter/material.dart';
import 'package:verifyd_store/config/app_config.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestScreen(title: AppConfig.of(context).appTitle),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
