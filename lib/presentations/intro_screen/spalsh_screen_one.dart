import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/resources/images.dart';
import 'package:gestapo/utils/utils.dart';

class SplashScreenOne extends StatelessWidget {
  static bool? value;
  const SplashScreenOne({super.key});

  Future<void> getSharedPreference() async {
    value = await LocalStorage.instance.readData<bool>(
      boxName: HiveBox.cacheBox,
      key: HiveKey.firstUser,
    );
  }

  Future<void> gotoNextScreen(context) async {
    await getSharedPreference();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        if (value == null || value == false) {
          return const SplashScreenTwo();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gotoNextScreen(context);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.appLogo,
                    width: context.width * 0.25,
                  ),
                  const SizedBox(width: 4),
                  kWidth12,
                  Text(
                    context.localization.gestapo,
                    style: context.textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            SpinKitCircle(color: context.colorScheme.primary),
            SizedBox(height: context.width * 0.03)
          ],
        ),
      ),
    );
  }
}
