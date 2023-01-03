import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.quantity,
  }) : super(key: key);
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.048,
      width: screenHeight * 0.048,
      decoration: BoxDecoration(
        color: kSpecialGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          quantity.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
