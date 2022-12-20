import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
  }) : super(key: key);

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
          '1',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
