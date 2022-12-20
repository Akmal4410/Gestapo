import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/checkout_screen.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: kSpecialGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: CommonButton(
          onPressed: onPressed,
          buttonText: buttonText,
          bgColor: kWhite,
        ),
      ),
    );
  }
}
