import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/quantity_add_widget.dart';

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
        QuantityAddWidget(),
        kHeight10,
      ],
    );
  }
}
