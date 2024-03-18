import 'package:flutter/material.dart';
import 'package:gestapo/presentations/intro_screen/intro_screen.dart';
import 'package:gestapo/utils/utils.dart';

class SplashScreenTwo extends StatelessWidget {
  Future<void> setPreference() async {
    await LocalStorage.instance.writeData<bool>(
      boxName: HiveBox.cacheBox,
      key: HiveKey.firstUser,
      value: true,
    );
  }

  Future<void> gotoIntroScreen(context) async {
    await setPreference();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const IntroScreen();
        },
      ),
    );
  }

  const SplashScreenTwo({super.key});

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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
