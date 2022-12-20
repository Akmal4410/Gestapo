import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';

class AdminAddProductScreen extends StatefulWidget {
  const AdminAddProductScreen({super.key});

  @override
  State<AdminAddProductScreen> createState() => _AdminAddProductScreenState();
}

class _AdminAddProductScreenState extends State<AdminAddProductScreen> {
  List<String> brandList = [
    'Nike',
    'Adidas',
    'Puma',
    'Reebook',
    'Acics',
    'New Balance',
    'Levis',
    'Others',
  ];

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
                    width: double.infinity,
                    color: kGrey,
                    height: double.infinity,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: kWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    kHeight10,
                    CommonHeading(text: 'Product Name'),
                    kHeight10,
                    CustomTextField(
                      hintText: 'Product Name',
                      icon: Icons.shopping_cart_outlined,
                    ),
                    kHeight10,
                    CommonHeading(text: 'Product Description'),
                    kHeight10,
                    CustomTextField(
                      maxLines: 6,
                      hintText: 'Description',
                      icon: Icons.info_outline_rounded,
                    ),
                    kHeight10,
                    CommonHeading(text: 'Brand'),
                    kHeight10,
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: kLightGrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        borderRadius: BorderRadius.circular(15),
                        dropdownColor: kSpecialGrey,
                        hint: Text(
                          'Select Item',
                          style: TextStyle(color: kWhite),
                        ),
                        isExpanded: true,
                        items: brandList.map((brandValue) {
                          return DropdownMenuItem(
                            value: brandValue,
                            child: Text(
                              brandValue,
                              // style: TextStyle(color: kBlack),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    kHeight10,
                    CommonHeading(text: 'Available Size'),
                    kHeight10,
                    CustomTextField(
                      hintText: 'Sizes',
                      icon: Icons.pin_outlined,
                    ),
                    kHeight10,
                    CommonHeading(text: 'Price'),
                    kHeight10,
                    CustomTextField(
                      hintText: 'price',
                      icon: Icons.money_outlined,
                    ),
                    kHeight20,
                    CommonButton(
                      onPressed: () {},
                      buttonText: 'Add Product',
                      bgColor: kWhite,
                    ),
                    kHeight20,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
