import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/utils.dart';
import 'package:gestapo/main.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatelessWidget {
  CreateProfileScreen({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final phoneController = TextEditingController();

  String? imagePath;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    imagePath = image.path;
  }

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
          child: Form(
            key: formKey,
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
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                kHeight25,
                CustomTextField(
                  controller: firstNameController,
                  hintText: 'First Name',
                  icon: Icons.person,
                  validator: (name) {
                    if (name != null && name.length < 5) {
                      return "Enter a valid name";
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight25,
                CustomTextField(
                  controller: secondNameController,
                  hintText: 'Last Name',
                  icon: Icons.person,
                  validator: (name) {
                    if (name != null && name.length < 5) {
                      return "Enter a valid name";
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight25,
                CustomTextField(
                  controller: phoneController,
                  hintText: 'Phone',
                  icon: Icons.phone,
                  validator: (phone) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = new RegExp(pattern);
                    if (phone != null && phone.length == 0) {
                      return 'Please enter mobile number';
                    } else if (phone != null && !regExp.hasMatch(phone)) {
                      return 'Please enter valid mobile number';
                    }
                    return null;
                  },
                ),
                kHeight25,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    bgColor: kWhite,
                    onPressed: () {
                      signUp(context);
                    },
                    buttonText: 'Sign in with password',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser(String email) {
    FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(email)
        .set({
      'First Name': firstNameController.text.trim(),
      'Second Name': secondNameController.text.trim(),
      'Phone': phoneController.text.trim(),
      'Email': email,
    });
  }

  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .onError((error, stackTrace) {
        return Utils.customSnackbar(
          context: context,
          text: error.toString(),
          type: AnimatedSnackBarType.warning,
        );
      }).then((value) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: SpinKitCircle(color: kWhite)),
        );
        createUser(email);
        showloggedInAlert(context: context);
      });
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    navigatorKey.currentState!.popUntil((route) => route.isCurrent);
  }
}

Future<void> gotoNavigationScreen(context) async {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    ),
    (route) => false,
  );
}

showloggedInAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      gotoNavigationScreen(context);
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
