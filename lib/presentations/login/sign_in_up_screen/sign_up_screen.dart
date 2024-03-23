import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/core/widgets/app_logo.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/or_widget.dart';
import 'package:gestapo/presentations/login/create_profile_screen/create_profile_screen.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/widget/sso_option_section.dart';
import 'package:gestapo/presentations/login/sign_in_up_screen/sign_in_screen.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0.h),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const AppLogo(),
                Text(
                  context.localization.createYourAccount,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 30.sp,
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
                kHeight24,
                CustomTextField(
                  controller: confirmPassController,
                  hintText: context.localization.confirmPassword,
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (pass) {
                    if (pass != null && pass.length < 6) {
                      return context
                          .localization.paswwordRequiresMinimumSixCharachter;
                    } else if (passwordController.text !=
                        confirmPassController.text) {
                      return context.localization.passwordDoesnotMatch;
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight24,
                CommonButton(
                  width: double.infinity,
                  bgColor: context.colorScheme.primary,
                  buttonText: context.localization.signUp,
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    Get.toNamed(CreateProfileScreen.path, arguments: {
                      "email": emailController.text.trim(),
                      "password": passwordController.text.trim(),
                    });
                  },
                ),
                kHeight24,
                OrWidget(orText: context.localization.orContinueWith),
                kHeight24,
                const SsoOptionSection(),
                kHeight24,
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: '${context.localization.alreadyHaveAnAccount} ',
                      children: <InlineSpan>[
                        TextSpan(
                          text: context.localization.signIn,
                          style: context.textTheme.titleMedium,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.offAllNamed(SignInScreen.path),
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
}
