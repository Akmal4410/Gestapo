import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domain/cart.dart';

class PriceCard extends StatelessWidget {
  PriceCard({
    Key? key,
    required this.cartItems,
    required this.promoCode,
  }) : super(key: key);

  final List<Cart> cartItems;
  final int promoCode;

  int amount = 0;

  double discount = 0;

  void getTotalAmountAndDiscount() {
    for (var item in cartItems) {
      amount = amount + (item.price * item.cartCount);
    }
    discount = (amount / 100) * promoCode;
  }

  @override
  Widget build(BuildContext context) {
    getTotalAmountAndDiscount();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Amount',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '₹ $amount.00')
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Promo',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '₹ ${discount.toInt()}'),
            ],
          ),
          kHeight10,
          kDivider,
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '₹ ${(amount - discount.toInt())}.00')
            ],
          ),
        ],
      ),
    );
  }
}
