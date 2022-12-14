import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/user/home/brand_screen/brand_screen.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    Key? key,
    required this.imagePath,
    required this.brandName,
  }) : super(key: key);
  final String imagePath;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BrandScreen();
          },
        ));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.08,
            backgroundColor: kSpecialGrey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            brandName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
