import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.quantity,
  });
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.048,
      width: context.height * 0.048,
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
