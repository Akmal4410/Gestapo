import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/presentations/user/home/brand_screen/brand_screen.dart';
import 'package:gestapo/utils/utils.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.imagePath,
    required this.brandName,
  });
  final String imagePath;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BrandScreen(brand: brandName);
          },
        ));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: context.width * 0.08,
            backgroundColor: AppColors.kSpecialGrey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: brandName == 'More'
                  ? Image.asset(imagePath)
                  : Image.network(
                      imagePath,
                    ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            brandName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
