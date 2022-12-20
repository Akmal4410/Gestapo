import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class QuantityAddWidget extends StatelessWidget {
  const QuantityAddWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.25,
      height: screenHeight * 0.048,
      decoration: BoxDecoration(
        color: kSpecialGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.remove,
            color: kWhite,
          ),
          Text(
            '1',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.add,
            color: kWhite,
          ),
        ],
      ),
    );
  }
}
