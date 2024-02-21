import 'dart:developer';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final phoneController = TextEditingController();

  XFile? imagePath;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      imagePath = image;
    });
  }

  Future<String> uploadImage() async {
    if (imagePath == null) return '';

    final path = 'file/${imagePath!.name}';
    final file = File(imagePath!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    final imageDownloadUrl = snapshot.ref.getDownloadURL();

    return imageDownloadUrl;
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
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: kWhite,
                        backgroundImage: imagePath == null
                            ? null
                            : FileImage(File(imagePath!.path)),
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
                    if (name != null && name.length < 2) {
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
                    RegExp regExp = RegExp(pattern);
                    if (phone != null && phone.isEmpty) {
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

  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (imagePath == null) return;

    try {
      _auth
          .createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
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
          builder: (context) =>
              const Center(child: SpinKitCircle(color: kWhite)),
        );
        final image = await uploadImage();
        await UserModel.createUser(
          firstName: firstNameController.text.trim(),
          lastName: secondNameController.text.trim(),
          phone: phoneController.text.trim(),
          email: widget.email,
          image: image,
        );
        showloggedInAlert(context: context);
      });
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
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
