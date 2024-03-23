import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/domaina/signIn.dart';
import 'package:gestapo/presentations/admin/navigation_screen/admin_navigation_screen.dart';
import 'package:gestapo/presentations/login/login_screen/widget/login_option_widget.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';
import 'package:gestapo/presentations/user/navigation_screen/user_navigation_screen.dart';
import 'package:gestapo/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  static const String path = "/login_screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitCircle(color: AppColors.kWhite);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.email == 'admin@gmail.com') {
            return AdminNavigationScreen();
          } else {
            return const UserNavigationScreen();
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.appLogo,
                      width: context.width * 0.40,
                    ),
                    kHeight24,
                    Text(
                      context.localization.letsYouIn,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(fontSize: 32.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              LoginOptionWidgets(
                optionText: Images.facebook,
                buttonText: context.localization.continueWithFacebook,
                onTap: SignIn.signInWithFacebook,
              ),
              LoginOptionWidgets(
                optionText: Images.google,
                buttonText: context.localization.continuewithGoogle,
                onTap: SignIn.signInWithGoogle,
              ),
              const SizedBox(height: 5),
              OrWidget(orText: context.localization.or),
              kHeight24,
              CommonButton(
                bgColor: AppColors.kWhite,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
                buttonText: context.localization.signInWithPassword,
              ),
              kHeight24,
              Center(
                child: Text.rich(
                  TextSpan(
                    text: '${context.localization.dontHaveAnAccount} ',
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
                        text: context.localization.signUp,
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
    );
  }
}
