import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.bgColor,
    this.width,
  });
  final void Function() onPressed;
  final String buttonText;
  final Color bgColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const StadiumBorder(),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Text(
            buttonText,
            style: context.textTheme.titleMedium?.copyWith(
              color: bgColor == AppColors.kWhite
                  ? AppColors.kBlack
                  : AppColors.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
