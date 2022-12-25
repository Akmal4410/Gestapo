import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: screenHeight * 0.075,
        decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: kBorderGrey,
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
