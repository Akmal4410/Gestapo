import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/intro_screen/spalsh_screen_one.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const SHARED_KEY = "Shared_Key";
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gestapo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          titleMedium: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          bodySmall: TextStyle(
            color: kWhite,
            fontFamily: 'Poppins',
          ),
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const SplashScreenOne(),
    );
  }
}
