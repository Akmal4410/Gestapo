import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.shopping_bag_outlined,
          size: 50,
          color: kWhite,
        ),
      ),
    );
  }
}
