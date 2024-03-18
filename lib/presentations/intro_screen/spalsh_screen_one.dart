import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/resources/resources.dart';
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

  Future<void> gotoSplachScreenTwo(context) async {
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
    // gotoSplachScreenTwo(context);

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
                    'assets/images/Gestapo.png',
                    width: context.width * 0.25,
                  ),
                  const Text(
                    'Gestapo',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SpinKitCircle(color: AppColors.kWhite),
            SizedBox(height: context.width * 0.03)
          ],
        ),
      ),
    );
  }
}
