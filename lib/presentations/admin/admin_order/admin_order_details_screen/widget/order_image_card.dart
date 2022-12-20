import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class OrderImageCard extends StatelessWidget {
  const OrderImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.all(20),
        color: kWhite,
        child: Image.asset(
          'assets/images/nike1.jpg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
