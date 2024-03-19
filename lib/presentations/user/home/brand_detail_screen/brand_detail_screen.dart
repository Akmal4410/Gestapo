import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_description_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_main_details_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_price_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_quantity_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_size_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/image_card.dart';

class BrandDetailScreen extends StatefulWidget {
  BrandDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<BrandDetailScreen> createState() => _BrandDetailScreenState();
}

class _BrandDetailScreenState extends State<BrandDetailScreen> {
  late int size = int.parse(sizes[0]);

  int quantity = 1;

  List<String> sizes = [];

  void convertSizeToList() {
    sizes = widget.product.size.split(',');
  }

  void selectSize(int newSize) {
    size = newSize;
  }

  void getQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    convertSizeToList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBackgroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          ImageCard(images: widget.product.images),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandMainDetailsCard(product: widget.product),
                  kHeight12,
                  const Divider(color: AppColors.kWhite),
                  BrandDescriptionCard(description: widget.product.description),
                  kHeight12,
                  BrandSizeCard(sizes: sizes, selectSize: selectSize),
                  kHeight12,
                  BrandQuantityCard(getQuantity: getQuantity),
                  kHeight12,
                  const Divider(color: AppColors.kWhite),
                  kHeight12,
                  BrandPriceCard(
                    product: widget.product,
                    size: size,
                    quantity: quantity,
                  ),
                  kHeight12
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
