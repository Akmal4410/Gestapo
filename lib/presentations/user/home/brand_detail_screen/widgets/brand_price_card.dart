import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';

class BrandPriceCard extends StatelessWidget {
  const BrandPriceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                color: kGrey,
              ),
            ),
            Text(
              '₹ 1500.00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        kWidth10,
        Expanded(
          child: CommonButton(
            onPressed: () {},
            buttonText: 'Add to Cart',
            bgColor: kWhite,
          ),
        ),
      ],
    );
  }
}
