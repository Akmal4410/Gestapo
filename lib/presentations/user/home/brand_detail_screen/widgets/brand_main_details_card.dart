import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/home/review_screen/review_screen.dart';

class BrandMainDetailsCard extends StatelessWidget {
  const BrandMainDetailsCard({
    Key? key,
    required this.productName,
  }) : super(key: key);
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: const TextStyle(
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ReviewScreen();
                  },
                ));
              },
              child: Text(
                '4.9(6,573 Reviews)',
                style: TextStyle(
                  color: kGrey,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
