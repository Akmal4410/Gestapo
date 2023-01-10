import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/category.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Categories'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<List<Category>>(
          stream: Category.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Something Went Wrong ${snapshot.toString()}'));
            } else if (snapshot.hasData) {
              final categories = snapshot.data;
              if (categories!.isEmpty) {
                return const Center(child: Text("Categories are Empty"));
              } else {
                return ListView(
                  children: categories.map(builCategory).toList(),
                );
              }
            } else {
              return const SpinKitCircle(color: kWhite);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSpecialGrey,
        onPressed: () {
          showAddCategoryDialoge(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddCategoryDialoge(context) {
    final categoryController = TextEditingController();
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

    Future<void> addCategory() async {
      if (imageFile == null) return;
      if (!formKey.currentState!.validate()) {
        return;
      }

      final downloadImageUrl = await uploadImage();
      log('Image Uploaded succeffuly $downloadImageUrl');

      await Category.addCategory(
        category: categoryController.text.trim(),
        image: downloadImageUrl,
      );
      log('Category added succeffuly');

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
            backgroundColor: kBorderGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CommonHeading(text: 'Add Catergory'),
                    kHeight10,
                    StatefulBuilder(
                      builder: (context, StateSetter setState) {
                        return Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: kLightGrey,
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
                                    color: kWhite,
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
                      controller: categoryController,
                      hintText: 'Category',
                      icon: Icons.category,
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return 'Enter a valid category';
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
                            bgColor: kSpecialGrey,
                          ),
                        ),
                        kWidth10,
                        Expanded(
                          child: CommonButton(
                            buttonText: 'Add',
                            onPressed: () async {
                              await addCategory();
                            },
                            bgColor: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget builCategory(Category category) {
  return Container(
    margin: const EdgeInsets.only(
      bottom: 10,
    ),
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      color: kLightGrey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration:
            const BoxDecoration(color: kSpecialGrey, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            category.image,
          ),
        ),
      ),
      title: Text(category.category),
    ),
  );
}
