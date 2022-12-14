import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/brand_card.dart';

class ShoeBrands extends StatelessWidget {
  const ShoeBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BrandCard(
              imagePath: 'assets/images/nike.png',
              brandName: 'Nike',
            ),
            BrandCard(
              imagePath: 'assets/images/adidas.png',
              brandName: 'Adidas',
            ),
            BrandCard(
              imagePath: 'assets/images/puma.png',
              brandName: 'Puma',
            ),
            BrandCard(
              imagePath: 'assets/images/reebok.png',
              brandName: 'Reebok',
            ),
          ],
        ),
        kHeight25,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BrandCard(
              imagePath: 'assets/images/asics.png',
              brandName: 'Asics',
            ),
            BrandCard(
              imagePath: 'assets/images/newBalance.png',
              brandName: 'New Balance',
            ),
            BrandCard(
              imagePath: 'assets/images/levis.png',
              brandName: 'Levis',
            ),
            BrandCard(
              imagePath: 'assets/images/more.png',
              brandName: 'More',
            ),
          ],
        ),
      ],
    );
  }
}
