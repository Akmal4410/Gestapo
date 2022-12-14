import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class BrandQuantityCard extends StatelessWidget {
  const BrandQuantityCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Quantity',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        kWidth10,
        Container(
          width: 120,
          height: 45,
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
        ),
        kHeight10,
      ],
    );
  }
}
