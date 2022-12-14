import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 50,
          color: kWhite,
        ),
      ),
    );
  }
}
