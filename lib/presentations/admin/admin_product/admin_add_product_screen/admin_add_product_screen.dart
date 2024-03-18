import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domaina/category.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/resources/resources.dart';

class AdminAddProductScreen extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();

  AdminAddProductScreen({super.key});
  final productNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final sizeController = TextEditingController();
  final priceController = TextEditingController();

  static UploadTask? uploadTask;
  static final ValueNotifier<List<File>> images = ValueNotifier([]);
  static String _brand = 'Others';

  void onDropDownChanged(String data) {
    _brand = data;
    log(_brand.toString());
  }

  Future<void> pickMultipleImage() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    images.value = result.paths.map((path) => File(path!)).toList();
    images.notifyListeners();
  }

  Future<List<String>> uploadImages() async {
    if (images.value.isEmpty) return [];
    List<String> imagesurl = [];
    for (var image in images.value) {
      final path = 'files/products/${image.path}';
      final file = File(image.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);

      final snapshot = await uploadTask!.whenComplete(() {});
      final uploadUrl = await snapshot.ref.getDownloadURL();
      imagesurl.add(uploadUrl);
    }
    return imagesurl;
  }

  Future<void> addProduct(BuildContext context) async {
    if (images.value.isEmpty) return;
    final imageList = await uploadImages();
    log('Images added Successfully');
    await Product.addProduct(
      productName: productNameController.text.trim(),
      images: imageList,
      description: descriptionController.text.trim(),
      category: _brand,
      size: sizeController.text.trim(),
      price: priceController.text.trim(),
    );
    log('product Added Successufuly to the Firebase');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add Products'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: AppColors.kGreyLight,
                    height: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: images,
                        builder: (BuildContext context, List<File> images,
                            Widget? _) {
                          return GridView.builder(
                            itemCount: images.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return Image.file(
                                File(images[index].path),
                                fit: BoxFit.cover,
                                //  fit: BoxFit.cover,
                              );
                            },
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () async {
                        await pickMultipleImage();
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.kWhite,
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kHeight10,
                      const CommonHeading(text: 'Product Name'),
                      kHeight10,
                      CustomTextField(
                        controller: productNameController,
                        hintText: 'Product Name',
                        icon: Icons.shopping_cart_outlined,
                        validator: (name) {
                          return name != null && name.length < 4
                              ? "Enter Product Name"
                              : null;
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Product Description'),
                      kHeight10,
                      CustomTextField(
                        controller: descriptionController,
                        maxLines: 6,
                        hintText: 'Description',
                        icon: Icons.info_outline_rounded,
                        validator: (description) {
                          return description != null && description.length < 10
                              ? "Enter Description"
                              : null;
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Brand'),
                      kHeight10,
                      CategoryDropDown(
                        onChanged: onDropDownChanged,
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Available Size'),
                      kHeight10,
                      CustomTextField(
                        controller: sizeController,
                        hintText: 'Sizes(Seprated by ,)',
                        icon: Icons.pin_outlined,
                        validator: (size) {
                          return size != null && size.length < 2
                              ? "Enter the available sizes"
                              : null;
                        },
                      ),
                      kHeight10,
                      const CommonHeading(text: 'Price'),
                      kHeight10,
                      CustomTextField(
                        controller: priceController,
                        hintText: 'price',
                        icon: Icons.money_outlined,
                        validator: (price) {
                          return price != null && price.length < 2
                              ? "Enter the Price"
                              : null;
                        },
                      ),
                      kHeight20,
                      CommonButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) return;
                          await addProduct(context);
                        },
                        buttonText: 'Add Product',
                        bgColor: AppColors.kWhite,
                      ),
                      kHeight20,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDropDown extends StatefulWidget {
  CategoryDropDown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final void Function(String) onChanged;

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: FutureBuilder(
          future: Category.getCategories().first,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                  'Something error occured ${snapshot.error.toString()}');
            } else if (snapshot.hasData) {
              final categories = snapshot.data!;
              return DropdownButton<String>(
                value: selectedItem,
                underline: const SizedBox(),
                borderRadius: BorderRadius.circular(15),
                dropdownColor: AppColors.kGreyDark,
                hint: const Text(
                  'Select Item',
                  style: TextStyle(color: AppColors.kWhite),
                ),
                isExpanded: true,
                items: categories.map((brandValue) {
                  return DropdownMenuItem<String>(
                    value: brandValue.category,
                    child: Text(
                      brandValue.category,
                      // style: TextStyle(color: kBlack),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value;
                    widget.onChanged(value!);
                  });
                },
              );
            } else {
              return const SpinKitCircle(color: AppColors.kWhite);
            }
          }),
    );
  }
}
