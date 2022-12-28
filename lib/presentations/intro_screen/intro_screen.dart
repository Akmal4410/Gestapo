import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/main.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController? controller;
  @override
  void initState() {
    controller = PageController();

    super.initState();
  }

  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? kWhite : kGrey,
      ),
    );
  }

  List<String> contentText = [
    'We provide high quality products just for you',
    'Your satisfaction is our number one priority',
    'Let\'s fulfill your fashion needs with gestapo right now!'
  ];

  List<String> contentImage = [
    'assets/images/intro1.jpg',
    'assets/images/intro2.jpg',
    'assets/images/intro3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.68,
                      width: double.infinity,
                      child: Image.asset(
                        contentImage[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        contentText[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => buildDot(index),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: CommonButton(
                bgColor: kWhite,
                buttonText: currentIndex != contentText.length - 1
                    ? 'Next'
                    : 'Continue',
                onPressed: () {
                  if (currentIndex == contentText.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  }
                  controller!.nextPage(
                    duration: const Duration(microseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
              )),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
