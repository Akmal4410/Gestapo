import 'package:flutter/material.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/small_login_option_widget.dart';
import 'package:gestapo/presentations/login/create_profile_screen/create_profile_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

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
                const CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  obscureText: false,
                ),
                kHeight25,
                const CustomTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                kHeight25,
                const CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                kHeight25,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CreateProfileScreen();
                        },
                      ));
                    },
                    buttonText: 'Sign up',
                  ),
                ),
                kHeight25,
                const OrWidget(orText: 'or continue with'),
                kHeight25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SmallLoginOptionWidget(image: 'assets/images/facebook.png'),
                    SmallLoginOptionWidget(image: 'assets/images/google.png'),
                  ],
                ),
                kHeight25,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ));
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Sign In',
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
      ),
    );
  }
}
