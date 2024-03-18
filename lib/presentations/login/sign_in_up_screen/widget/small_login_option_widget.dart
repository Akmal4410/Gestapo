import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class SmallLoginOptionWidget extends StatelessWidget {
  const SmallLoginOptionWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      width: context.width * 0.22,
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
            width: context.width * 0.07,
          ),
        ),
      ),
    );
  }
}
