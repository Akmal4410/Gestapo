import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestapo/gestapo_app.dart';
import 'package:gestapo/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.instance.initHive();
  AppConfig.create(
    appName: "Gestapo Dev",
    baseUrl: "https://gestapotest.com",
    flavor: Flavor.dev,
  );
  runApp(const GestapoApp());
}
