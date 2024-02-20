import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/main.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenOne extends StatelessWidget {
  static bool? value;
  const SplashScreenOne({super.key});

  Future<void> getSharedPreference() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    value = sharedPrefs.getBool(SHARED_KEY);
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
    gotoSplachScreenTwo(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                    width: screenWidth * 0.25,
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
            const SpinKitCircle(
              color: kWhite,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
