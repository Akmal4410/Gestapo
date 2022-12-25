import 'package:flutter/material.dart';
import 'package:gestapo/main.dart';
import 'package:gestapo/presentations/intro_screen/intro_screen.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenTwo extends StatelessWidget {
  bool? value;

  Future<void> getSharedPreference() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    value = sharedPrefs.getBool(SHARED_KEY);
  }

  Future<void> gotoIntroScreen(context) async {
    await getSharedPreference();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (value == null || value == false) {
            return const IntroScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }

  SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    gotoIntroScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/spalsh_two.jpeg'),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                ],
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome 👋',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Gestapo',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The best sneakers & shoes e-commerce app of the century for your fashion needs',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
