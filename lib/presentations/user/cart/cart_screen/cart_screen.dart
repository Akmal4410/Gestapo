import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_checkout_card.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight25,
                Expanded(
                  child: ListView.separated(
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItem(
                        bgColor: kLightGrey,
                      );
                    },
                    separatorBuilder: (context, index) => kHeight20,
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
        CartCheckoutCard()
      ],
    );
  }
}
