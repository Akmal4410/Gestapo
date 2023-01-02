import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/quantity_add_widget.dart';

class BrandQuantityCard extends StatelessWidget {
  const BrandQuantityCard({
    Key? key,
    required this.getQuantity,
  }) : super(key: key);
  final void Function(int) getQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Quantity',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        kWidth10,
        QuantityAddWidget(
          getQuantity: getQuantity,
          currentQuantity: 1,
        ),
        kHeight10,
      ],
    );
  }
}
