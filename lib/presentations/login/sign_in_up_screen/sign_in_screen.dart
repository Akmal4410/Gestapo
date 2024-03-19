import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/small_login_option_widget.dart';
import 'package:gestapo/presentations/login/forget_password_screen/forget_password_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:gestapo/utils/utils.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({
    super.key,
  });

  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/Gestapo.png',
                    width: context.width * 0.40,
                  ),
                  const Text(
                    'Login to Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHeight24,
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: (email) {
                      return email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null;
                    },
                  ),
                  kHeight24,
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (pass) {
                      if (pass != null && pass.length < 6) {
                        return 'Paswword requires minimum 6 charachter';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: CommonButton(
                      bgColor: AppColors.kWhite,
                      onPressed: () {
                        signIn(context);
                      },
                      buttonText: 'Sign In',
                    ),
                  ),
                  kHeight24,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordScreen();
                        },
                      ));
                    },
                    child: const Text(
                      'Forget the Password ?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const OrWidget(orText: 'or continue with'),
                  kHeight24,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallLoginOptionWidget(
                          image: 'assets/images/facebook.png'),
                      SmallLoginOptionWidget(image: 'assets/images/google.png'),
                    ],
                  ),
                  kHeight24,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
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
                  kHeight24,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .onError((error, stackTrace) {
        return Utils.customSnackbar(
          context: context,
          text: error.toString(),
          type: AnimatedSnackBarType.warning,
        );
      }).then((value) async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const Center(
              child: SpinKitCircle(
                color: AppColors.kWhite,
              ),
            );
          },
        );
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
