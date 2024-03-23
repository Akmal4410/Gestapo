import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';
import 'package:gestapo/resources/images.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';

class SplashScreenOne extends StatelessWidget {
  static const String path = "/spalsh_screen_one";

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
    if (value == null || value == false) {
      Get.offAndToNamed(SplashScreenTwo.path);
    } else {
      // return const LoginScreen();
      Get.offAndToNamed(SplashScreenTwo.path);
    }
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
                  kWidth8,
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
