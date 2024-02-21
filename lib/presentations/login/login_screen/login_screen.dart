import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/domaina/signIn.dart';
import 'package:gestapo/presentations/admin/admin_navigation_screen/admin_navigation_screen.dart';
import 'package:gestapo/presentations/login/login_screen/widget/login_option_widget.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';
import 'package:gestapo/presentations/user/user_navigation_screen/screens/user_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitCircle(color: kWhite);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.email == 'admin@gmail.com') {
            return AdminNavigationScreen();
          } else {
            return UserNavigationScreen();
          }
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

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
                    Image.asset(
                      'assets/images/Gestapo.png',
                      width: screenWidth * 0.40,
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
              LoginOptionWidgets(
                optionText: 'assets/images/facebook.png',
                buttonText: 'Continue with Facebook',
                onTap: () {
                  SignIn.signInWithFacebook();
                },
              ),
              LoginOptionWidgets(
                optionText: 'assets/images/google.png',
                buttonText: 'Continue with Google',
                onTap: () {
                  SignIn.signInWithGoogle();
                },
              ),
              const SizedBox(height: 5),
              const OrWidget(orText: 'or'),
              kHeight25,
              CommonButton(
                bgColor: kWhite,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
                buttonText: 'Sign in with password',
              ),
              kHeight25,
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    children: <InlineSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                        text: 'Sign Up',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
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
