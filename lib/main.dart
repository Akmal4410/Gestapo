import 'package:flutter/material.dart';
import 'package:gestapo/presentations/intro_screen/spalsh_screen_one.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestapo/utils/theme/my_theme.dart';
import 'package:gestapo/utils/theme/theme_provider.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

const SHARED_KEY = "Shared_Key";
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GestapoApp());
}

class GestapoApp extends StatelessWidget {
  const GestapoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Gestapo',
          home: const SplashScreenOne(),
        );
      },
    );
  }
}
