import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/utils/utils.dart';

class LoginOptionWidgets extends StatelessWidget {
  const LoginOptionWidgets({
    super.key,
    required this.buttonText,
    required this.optionImg,
    required this.onTap,
  });
  final String buttonText;
  final String optionImg;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0.h),
        width: double.infinity,
        height: context.height * 0.075,
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.colorScheme.outline, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              optionImg,
              width: 30.w,
            ),
            kWidth12,
            Text(
              buttonText,
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
