import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/resources/resources.dart';

class AdminProductDetailsScreen extends StatelessWidget {
  const AdminProductDetailsScreen({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Products Details'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.kGrey,
                    height: double.infinity,
                    child: Image.network(
                      product.images[0],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight10,
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight10,
                  kHeight10,
                  Text(
                    product.description,
                    style: const TextStyle(
                      color: AppColors.kGrey,
                    ),
                  ),
                  kHeight10,
                  const Text(
                    'Brand Name : Nike',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight10,
                  Text(
                    'Available Sizes : ${product.size}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight10,
                  Text(
                    'Price : ₹ ${product.price}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
