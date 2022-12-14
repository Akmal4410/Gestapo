import 'package:flutter/material.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/presentations/login/login_screen/widget/login_option_widget.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.20,
                      backgroundColor: Colors.grey.shade700,
                    ),
                    kHeight25,
                    const Text(
                      'Let\'s you in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const LoginOptionWidgets(
                optionText: 'assets/images/facebook.png',
                buttonText: 'Continue with Facebook',
              ),
              const LoginOptionWidgets(
                optionText: 'assets/images/google.png',
                buttonText: 'Continue with Google',
              ),
              const SizedBox(height: 5),
              const OrWidget(orText: 'or'),
              kHeight25,
              CommonButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInScreen();
                  }));
                },
                buttonText: 'Sign in with password',
              ),
              kHeight25,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              kHeight25,
            ],
          ),
        ),
      ),
    );
  }
}
