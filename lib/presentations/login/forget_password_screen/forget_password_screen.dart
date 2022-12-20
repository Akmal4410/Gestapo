import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/presentations/login/forget_password_screen/check_mail.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Forget Password'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kHeight25,
                const CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                ),
                kHeight25,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    bgColor: kWhite,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CheckMail();
                        },
                      ));
                    },
                    buttonText: 'Send Mail',
                  ),
                ),
                kHeight25,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
