import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/domaina/cart.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/checkout_screen.dart';

class CartCheckoutCard extends StatelessWidget {
  CartCheckoutCard({
    Key? key,
    required this.cartItems,
  }) : super(key: key);
  final List<Cart> cartItems;

  int totalPrice = 0;

  void getCartQuantityAndPrice() {
    for (var item in cartItems) {
      totalPrice = totalPrice + (item.cartCount * item.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCartQuantityAndPrice();

    return Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        color: AppColors.kGreyDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(
                    color: AppColors.kGreyLight,
                  ),
                ),
                Text(
                  '₹ $totalPrice',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            kWidth12,
            Expanded(
              child: CommonButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CheckoutScreen(cartItems: cartItems);
                      },
                    ),
                  );
                },
                buttonText: 'Check Out',
                bgColor: AppColors.kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
