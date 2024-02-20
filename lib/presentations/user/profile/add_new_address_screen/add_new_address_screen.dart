import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/address.dart';
import 'package:gestapo/domain/utils.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!.email;

  final formKey = GlobalKey<FormState>();
  final addresssTypeController = TextEditingController();
  final placeController = TextEditingController();
  final sublocalityController = TextEditingController();
  final localityController = TextEditingController();
  final pinCodeContoller = TextEditingController();

  Future<void> addNewAddress({
    required BuildContext context,
    required String user,
    required String addressName,
    required String addressDetails,
  }) async {
    if (addressName.isEmpty) return;
    await Address.addNewAddress(
      user: user,
      addressName: addressName,
      addressDetails: addressDetails,
    );
    Navigator.pop(context);
    Utils.customSnackbar(
      context: context,
      text: 'Address addedd successfully',
      type: AnimatedSnackBarType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add New Address'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonHeading(text: 'Address type'),
                      kHeight10,
                      CustomTextField(
                        controller: addresssTypeController,
                        hintText: 'Address type eg.(Home, Office..)',
                        icon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Enter correct address type';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Place'),
                      kHeight10,
                      CustomTextField(
                        controller: placeController,
                        hintText: 'place',
                        icon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Enter correct place';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Sublocality'),
                      kHeight10,
                      CustomTextField(
                        controller: sublocalityController,
                        hintText: 'Sublocality',
                        icon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Enter correct sublocality';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Locality'),
                      kHeight10,
                      CustomTextField(
                        controller: localityController,
                        hintText: 'locality',
                        icon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value != null && value.length < 4) {
                            return 'Enter correct locality';
                          } else {
                            return null;
                          }
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Pin Code'),
                      kHeight10,
                      CustomTextField(
                        controller: pinCodeContoller,
                        hintText: 'Pin code',
                        icon: Icons.location_on_outlined,
                        validator: (value) {
                          if (value != null && value.length < 6) {
                            return 'Enter correct pincode';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CommonButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;
                  String addressDetails =
                      '${placeController.text.trim()}, ${sublocalityController.text.trim()}, ${localityController.text.trim()}, ${pinCodeContoller.text.trim()},';
                  await addNewAddress(
                    context: context,
                    user: user!,
                    addressName: addresssTypeController.text,
                    addressDetails: addressDetails,
                  );
                },
                buttonText: 'Add Address',
                bgColor: kWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
