import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/widgets/app_logo.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/presentations/login/create_profile_screen/create_profile_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/sso_option_section.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String path = "/sign_up_screen";

  const SignUpScreen({
    super.key,
  });
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPassController = TextEditingController();

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const AppLogo(),
                  const Text(
                    'Create Your account',
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
                  kHeight24,
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
                  kHeight24,
                  SizedBox(
                    width: double.infinity,
                    child: CommonButton(
                      bgColor: AppColors.kWhite,
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
                  kHeight24,
                  const OrWidget(orText: 'or continue with'),
                  kHeight24,
                  const SsoOptionSection(),
                  kHeight24,
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
                  kHeight24,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
