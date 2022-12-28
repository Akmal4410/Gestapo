import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/domain/product.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/brand_detail_screen.dart';

class ShoeBreifCard extends StatelessWidget {
  const ShoeBreifCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const BrandDetailScreen();
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kSpecialGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(product.images[0]),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.productName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.star_half_rounded,
                  color: kWhite,
                ),
                const SizedBox(width: 6),
                const Text(
                  '4.5',
                ),
                const SizedBox(width: 10),
                Container(color: kWhite, width: 1, height: 15),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kSpecialGrey,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('8735 Sold'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '₹ ${product.price}.00',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
