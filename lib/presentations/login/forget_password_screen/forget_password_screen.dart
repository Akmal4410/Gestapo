import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/presentations/login/forget_password_screen/check_mail.dart';
import 'package:gestapo/utils/utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String path = "/forget_password_screen";

  const ForgetPasswordScreen({super.key});
  static final emailController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.forgetPassword),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.localization.enterYourEmail,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
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
              CommonButton(
                width: double.infinity,
                buttonText: context.localization.resetPassword,
                bgColor: context.colorScheme.primary,
                onPressed: () => resetPassword(context),
              ),
              kHeight24,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(child: SpinKitCircle(color: AppColors.kWhite)),
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return const CheckMail();
      },
    ));
  }
}
