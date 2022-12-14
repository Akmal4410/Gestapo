import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class BrandMainDetailsCard extends StatelessWidget {
  const BrandMainDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Air Jordan 3 Retro',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: kWhite,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kSpecialGrey,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('8735 Sold'),
              ),
            ),
            kWidth10,
            Icon(
              Icons.star_half,
              color: kWhite,
            ),
            kWidth10,
            Text(
              '4.9(6,573 Reviews)',
              style: TextStyle(
                color: kGrey,
              ),
            )
          ],
        ),
      ],
    );
  }
}
