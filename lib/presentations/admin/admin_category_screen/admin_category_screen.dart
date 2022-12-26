import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/category.dart';

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
        title: Text('Categories'),
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder<List<Category>>(
            stream: Category.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something Went Wrong ${snapshot.toString()}');
              } else if (snapshot.hasData) {
                final categories = snapshot.data;

                return ListView(
                  children: categories!.map(builCategory).toList(),
                );
              } else {
                return const SpinKitCircle(color: kWhite);
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSpecialGrey,
        onPressed: () {
          showAddCategoryDialoge(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddCategoryDialoge(context) {
    final categoryController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: kBorderGrey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonHeading(text: 'Add Catergory'),
                  kHeight20,
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
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            await Category.addCategory(
                                category: categoryController.text.trim());
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
      },
    );
  }
}

Widget builCategory(Category category) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 10,
    ),
    padding: EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      color: kLightGrey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(category.category),
  );
}
