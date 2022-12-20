import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          child: Column(
            children: [
              kHeight25,
              const CustomTextField(
                hintText: 'First Name',
                icon: Icons.person,
              ),
              kHeight25,
              const CustomTextField(
                hintText: 'Last Name',
                icon: Icons.person,
              ),
              kHeight25,
              const CustomTextField(
                hintText: 'Phone',
                icon: Icons.phone,
              ),
              kHeight25,
              SizedBox(
                width: double.infinity,
                child: CommonButton(
                  bgColor: kWhite,
                  onPressed: () {},
                  buttonText: 'Update',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
