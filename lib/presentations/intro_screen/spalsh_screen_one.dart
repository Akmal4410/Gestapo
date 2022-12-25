import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/intro_screen/splach_screen_two.dart';

class SplashScreenOne extends StatelessWidget {
  Future<void> gotoSplachScreenTwo(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreenTwo(),
      ),
    );
  }

  const SplashScreenOne({super.key});

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
