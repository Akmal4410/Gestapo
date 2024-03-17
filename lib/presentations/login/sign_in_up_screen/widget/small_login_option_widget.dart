import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class SmallLoginOptionWidget extends StatelessWidget {
  const SmallLoginOptionWidget({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.22,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.kBorderGrey,
          width: 1.5,
        ),
      ),
      child: Center(
        child: SizedBox(
          child: Image.asset(
            image,
            width: screenWidth * 0.07,
          ),
        ),
      ),
    );
  }
}
