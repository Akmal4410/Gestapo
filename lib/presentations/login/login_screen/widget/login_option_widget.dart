import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class LoginOptionWidgets extends StatelessWidget {
  const LoginOptionWidgets({
    Key? key,
    required this.buttonText,
    required this.optionText,
    required this.onTap,
  }) : super(key: key);
  final String buttonText;
  final String optionText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: context.height * 0.075,
        decoration: BoxDecoration(
          color: AppColors.kLightGrey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.kBorderGrey,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              optionText,
              width: 30,
            ),
            SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
