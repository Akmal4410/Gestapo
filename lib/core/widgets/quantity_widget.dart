import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

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
        color: AppColors.kSpecialGrey,
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
