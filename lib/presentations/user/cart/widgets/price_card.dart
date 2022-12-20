import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Amount',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '585.00')
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Promo',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '0.00')
            ],
          ),
          kHeight10,
          kDivider,
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 16),
              ),
              CommonHeading(text: '585.00')
            ],
          ),
        ],
      ),
    );
  }
}
