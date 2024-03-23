import 'dart:developer';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileScreen extends StatefulWidget {
  static const String path = "/create_profile_screen";

  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String? email;
  String? password;
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      email = Get.arguments["email"];
      password = Get.arguments["password"];
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(context.localization.fillYourProfile),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: context.colorScheme.tertiary,
                      backgroundImage: imagePath == null
                          ? null
                          : FileImage(File(imagePath!.path)),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 0,
                      child: GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          height: 30.r,
                          width: 30.r,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: context.colorScheme.secondary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              kHeight24,
              CustomTextField(
                controller: firstNameController,
                hintText: context.localization.firstName,
                icon: Icons.person,
                validator: (name) {
                  if (name != null && name.length < 5) {
                    return context.localization.enterAValidName;
                  } else {
                    return null;
                  }
                },
              ),
              kHeight24,
              CustomTextField(
                controller: secondNameController,
                hintText: context.localization.lastName,
                icon: Icons.person,
                validator: (name) {
                  if (name != null && name.length < 2) {
                    return context.localization.enterAValidName;
                  } else {
                    return null;
                  }
                },
              ),
              kHeight24,
              CustomTextField(
                controller: phoneController,
                hintText: context.localization.phone,
                icon: Icons.phone,
                validator: (phone) {
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = RegExp(pattern);
                  if (phone != null && phone.isEmpty) {
                    return context.localization.pleaseEnterMobileNumber;
                  } else if (phone != null && !regExp.hasMatch(phone)) {
                    return context.localization.pleaseEnterValidMobileNumber;
                  }
                  return null;
                },
              ),
              kHeight24,
              CommonButton(
                buttonText: context.localization.signInWithPassword,
                bgColor: context.colorScheme.primary,
                width: double.infinity,
                onPressed: () => signUp(context),
              ),
            ],
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
        email: email ?? "",
        password: password ?? "",
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
              const Center(child: SpinKitCircle(color: AppColors.kWhite)),
        );
        final image = await uploadImage();
        await UserModel.createUser(
          firstName: firstNameController.text.trim(),
          lastName: secondNameController.text.trim(),
          phone: phoneController.text.trim(),
          email: email ?? "",
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
            color: AppColors.kLightGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.kWhite,
                radius: 60,
              ),
              kHeight24,
              Text(
                'Congratulation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight24,
              Text(
                'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              kHeight24,
              SpinKitCircle(
                color: AppColors.kWhite,
              ),
            ],
          ),
        ),
      );
    },
  );
}
