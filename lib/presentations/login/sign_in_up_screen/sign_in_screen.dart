import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/widgets/app_logo.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/sso_option_section.dart';
import 'package:gestapo/presentations/login/forget_password_screen/forget_password_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_up_screen.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';

class SignInScreen extends StatelessWidget {
  static const String path = "/sign_in_screen";

  const SignInScreen({
    super.key,
  });

  static final _auth = FirebaseAuth.instance;
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0.h),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const AppLogo(),
                Text(
                  context.localization.loginToYourAccount,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
                kHeight24,
                CustomTextField(
                  controller: emailController,
                  hintText: context.localization.email,
                  icon: Icons.email,
                  validator: (email) {
                    return email != null && !EmailValidator.validate(email)
                        ? context.localization.enterAValidEmail
                        : null;
                  },
                ),
                kHeight24,
                CustomTextField(
                  controller: passwordController,
                  hintText: context.localization.password,
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (pass) {
                    if (pass != null && pass.length < 6) {
                      return context
                          .localization.paswwordRequiresMinimumSixCharachter;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 50.h),
                CommonButton(
                  width: double.infinity,
                  bgColor: context.colorScheme.primary,
                  onPressed: () => signIn(context),
                  buttonText: context.localization.signIn,
                ),
                kHeight24,
                GestureDetector(
                  onTap: () => Get.toNamed(ForgetPasswordScreen.path),
                  child: Text(
                    context.localization.forgetThePassword,
                    style: context.textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 30.h),
                OrWidget(orText: context.localization.orContinueWith),
                kHeight24,
                const SsoOptionSection(),
                kHeight24,
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: '${context.localization.dontHaveAnAccount} ',
                      children: <InlineSpan>[
                        TextSpan(
                          text: context.localization.signUp,
                          style: context.textTheme.titleMedium,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.offAllNamed(SignUpScreen.path),
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
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
              (route) => false,
            );
          },
        );
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
