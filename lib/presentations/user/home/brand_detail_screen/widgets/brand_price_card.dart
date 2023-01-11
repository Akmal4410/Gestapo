import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/domain/product.dart';
import 'package:gestapo/domain/utils.dart';

class BrandPriceCard extends StatelessWidget {
  BrandPriceCard({
    Key? key,
    required this.product,
    required this.size,
    required this.quantity,
  }) : super(key: key);
  final Product product;
  final int size;
  final int quantity;

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Price',
              style: TextStyle(
                color: kGrey,
              ),
            ),
            Text(
              '₹ ${product.price}.00',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        kWidth10,
        Expanded(
          child: CommonButton(
            onPressed: () async {
              log(size.toString());
              log(quantity.toString());
              Utils.customSnackbar(
                context: context,
                text: "Item added to the cart successfully",
                type: AnimatedSnackBarType.success,
              );
              await Cart.addToCart(
                user: userEmail!,
                productName: product.productName,
                image: product.images[0],
                size: size,
                price: int.parse(product.price),
                cartCount: quantity,
              );
            },
            buttonText: 'Add to Cart',
            bgColor: kWhite,
          ),
        ),
      ],
    );
  }
}
