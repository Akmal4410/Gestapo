import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';

class CheckMail extends StatelessWidget {
  const CheckMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kHeight25,
                const Text(
                  'Check your mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 50),
                const Text(
                  'We\'ve have sent a password recover instruction to your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                kHeight25,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    bgColor: AppColors.kWhite,
                    onPressed: () {},
                    buttonText: 'Open Mail',
                  ),
                ),
                kHeight25,
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ), (route) => false);
                  },
                  child: Text(
                    'Will do later',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                kHeight25,
                const Text(
                  'Didn\'t get any email? check your spam folder later or try again with a valid email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
