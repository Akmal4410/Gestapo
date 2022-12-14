import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Fill Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: kWhite,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(Icons.edit),
                      ),
                    )
                  ],
                ),
              ),
              kHeight25,
              const CustomTextField(
                hintText: 'First Name',
                icon: Icons.person,
                obscureText: false,
              ),
              kHeight25,
              const CustomTextField(
                hintText: 'Last Name',
                icon: Icons.person,
                obscureText: false,
              ),
              kHeight25,
              const CustomTextField(
                hintText: 'Phone',
                icon: Icons.phone,
                obscureText: false,
              ),
              kHeight25,
              SizedBox(
                width: double.infinity,
                child: CommonButton(
                  onPressed: () {
                    showloggedInAlert(context: context);
                  },
                  buttonText: 'Sign in with password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showloggedInAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kLightGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                backgroundColor: kWhite,
                radius: 60,
              ),
              kHeight25,
              Text(
                'Congratulation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight25,
              Text(
                'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              kHeight25,
              SpinKitCircle(
                color: kWhite,
              ),
            ],
          ),
        ),
      );
    },
  );
}
