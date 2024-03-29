import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/presentations/intro_screen/spalsh_screen_one.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.instance.initHive();
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
        return ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, _) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              themeMode: themeProvider.themeMode, //ThemeMode.system,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              title: 'Gestapo',
              home: const SplashScreenOne(),
            );
          },
        );
      },
    );
  }
}
