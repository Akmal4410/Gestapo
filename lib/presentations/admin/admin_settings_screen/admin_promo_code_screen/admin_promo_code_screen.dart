import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/promocode.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:image_picker/image_picker.dart';

class AdminPromoCodeScreen extends StatelessWidget {
  const AdminPromoCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Promo Code'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: PromoCode.getStreamPromoCode(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final promoList = snapshot.data;
              if (promoList!.isEmpty) {
                return const Center(
                  child: Text('Promo Code List is empty'),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => kHeight10,
                  itemCount: promoList.length,
                  itemBuilder: (context, index) {
                    return AdminPromoCardWidget(
                      promoList: promoList,
                      index: index,
                    );
                  },
                );
              }
            } else {
              return const Center(
                child: SpinKitCircle(color: AppColors.kWhite),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kSpecialGrey,
        onPressed: () {
          showAddPromoCodeDialoge(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AdminPromoCardWidget extends StatelessWidget {
  const AdminPromoCardWidget({
    super.key,
    required this.index,
    required this.promoList,
  });

  final int index;
  final List<PromoCode> promoList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: const CircleAvatar(
            radius: 27,
            backgroundColor: AppColors.kWhite,
            child: Icon(
              Icons.percent,
              color: AppColors.kBlack,
            ),
          ),
          title: Text(
            promoList[index].promo.toString(),
            style: const TextStyle(fontSize: 17),
          ),
          subtitle: Text(promoList[index].details),
          trailing: const Icon(
            Icons.delete,
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}

void showAddPromoCodeDialoge(context) async {
  final promocodeController = TextEditingController();
  final detailsController = TextEditingController();
  final colorController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  XFile? imageFile;
  UploadTask? uploadTask;

  Future<String> uploadImage() async {
    if (imageFile == null) {
      return "";
    }

    final path = 'files/${imageFile!.name}';
    final file = File(imageFile!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
  }

  Future<void> addPromoCode() async {
    if (imageFile == null) return;
    if (!formKey.currentState!.validate()) {
      return;
    }

    final downloadImageUrl = await uploadImage();
    log('Image Uploaded succeffuly $downloadImageUrl');

    await PromoCode.addPromoCode(
      color: colorController.text.trim(),
      image: downloadImageUrl,
      percent: int.parse(promocodeController.text.trim()),
      details: detailsController.text.trim(),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Category Added Succeffuly'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: AppColors.kBorderGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CommonHeading(text: 'Add Promo Code'),
                    kHeight10,
                    StatefulBuilder(
                      builder: (context, StateSetter setState) {
                        return Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: AppColors.kLightGrey,
                              backgroundImage: imageFile == null
                                  ? null
                                  : FileImage(File(imageFile!.path)),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  ////////PICK IMAGE//////////
                                  final image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (image == null) return;
                                  setState(() {
                                    imageFile = image;
                                  });

                                  ////////UPLOAD IMAGE//////////
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
                        );
                      },
                    ),
                    kHeight10,
                    CustomTextField(
                      controller: promocodeController,
                      hintText: 'Percentage',
                      icon: Icons.percent,
                      validator: (value) {
                        if (value != null && value.length < 2) {
                          return 'Enter a valid promocode';
                        } else if (int.parse(value!) > 25) {
                          return 'Enter a valid promocode';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kHeight20,
                    CustomTextField(
                      controller: detailsController,
                      hintText: 'offer validity',
                      icon: Icons.abc,
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return 'Enter a valid promocode';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kHeight20,
                    CustomTextField(
                      controller: colorController,
                      hintText: 'Color',
                      icon: Icons.abc,
                      validator: (value) {
                        if (value != null && value.length < 6) {
                          return 'Enter a valid color';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kHeight20,
                    Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            buttonText: 'Cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            bgColor: AppColors.kSpecialGrey,
                          ),
                        ),
                        kWidth10,
                        Expanded(
                          child: CommonButton(
                            buttonText: 'Add',
                            onPressed: () async {
                              await addPromoCode();
                            },
                            bgColor: AppColors.kWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
