import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/active_size_conatiner.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/inactive_size_conatiner.dart';

class BrandSizeCard extends StatelessWidget {
  const BrandSizeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight10,
        Row(
          children: [
            InactiveSizeContainer(),
            ActiveSizeContainer(),
            InactiveSizeContainer(),
          ],
        )
      ],
    );
  }
}
