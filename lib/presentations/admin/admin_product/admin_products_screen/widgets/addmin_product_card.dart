import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_product_details_screen/admin_product_details_screen.dart';
import 'package:gestapo/resources/resources.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AdminProductDetailsScreen(product: product);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        height: screenHeight * 0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kLightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      product.images[0],
                    ),
                  ),
                  color: AppColors.kSpecialGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            kWidth10,
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonHeading(text: product.productName),
                  Text(
                    '₹ ${product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
