import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/brand_detail_screen.dart';

class ShoeBreifCard extends StatelessWidget {
  const ShoeBreifCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BrandDetailScreen();
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
                child: Image.asset('assets/images/shoes.png'),
              ),
            ),
            SizedBox(height: 5),
            const Text(
              'Nike shoes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.star_half_rounded,
                  color: kWhite,
                ),
                SizedBox(width: 6),
                Text(
                  '4.5',
                ),
                SizedBox(width: 10),
                Container(color: kWhite, width: 1, height: 15),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kSpecialGrey,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('8735 Sold'),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              '₹ 1050.00',
              style: TextStyle(
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
