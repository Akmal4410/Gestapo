import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/presentations/login/create_profile_screen/create_profile_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/small_login_option_widget.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                    width: screenWidth * 0.40,
                  ),
                  const Text(
                    'Create Your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kHeight25,
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
                  kHeight25,
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
                  kHeight25,
                  CustomTextField(
                    controller: confirmPassController,
                    hintText: 'Confirm Password',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (pass) {
                      if (pass != null && pass.length < 6) {
                        return 'Paswword requires minimum 6 charachter';
                      } else if (passwordController.text !=
                          confirmPassController.text) {
                        return 'Password doesnot match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  kHeight25,
                  SizedBox(
                    width: double.infinity,
                    child: CommonButton(
                      bgColor: kWhite,
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CreateProfileScreen(
                                email:
                                    emailController.text.trim().toLowerCase(),
                                password: passwordController.text
                                    .trim()
                                    .toLowerCase(),
                              );
                            },
                          ),
                        );
                      },
                      buttonText: 'Sign up',
                    ),
                  ),
                  kHeight25,
                  const OrWidget(orText: 'or continue with'),
                  kHeight25,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallLoginOptionWidget(
                          image: 'assets/images/facebook.png'),
                      SmallLoginOptionWidget(image: 'assets/images/google.png'),
                    ],
                  ),
                  kHeight25,
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return SignInScreen();
                                  },
                                ));
                              },
                            text: 'Sign In',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
        ),
      ),
    );
  }
}
