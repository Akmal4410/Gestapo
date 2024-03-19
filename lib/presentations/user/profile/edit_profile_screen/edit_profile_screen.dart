import 'dart:developer';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    phoneController = TextEditingController(text: widget.user.phone);
    super.initState();
  }

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
    final imageUploadUrl = snapshot.ref.getDownloadURL();
    return imageUploadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.kWhite,
                        backgroundImage: (imagePath == null)
                            ? NetworkImage(widget.user.image)
                            : FileImage(
                                File(imagePath!.path),
                              ) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                kHeight24,
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
                kHeight24,
                CustomTextField(
                  controller: lastNameController,
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
                kHeight24,
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
                kHeight24,
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    bgColor: AppColors.kWhite,
                    onPressed: () async {
                      String? newImage;
                      if (imagePath == null) {
                        setState(() {
                          newImage = widget.user.image;
                          log('old Image');
                        });
                      } else {
                        newImage = await uploadImage();
                        log('New Iamge ');
                        setState(() {});
                      }
                      final newUser = UserModel(
                        firstName: firstNameController!.text.trim(),
                        lastName: lastNameController!.text.trim(),
                        phone: phoneController!.text.trim(),
                        email: widget.user.email,
                        image: newImage!,
                      );
                      await UserModel.editUserDetails(user: newUser);
                      log('userUpdated');

                      Utils.customSnackbar(
                          context: context,
                          text: 'Profile updated',
                          type: AnimatedSnackBarType.success);
                      Navigator.pop(context);
                    },
                    buttonText: 'Update',
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
