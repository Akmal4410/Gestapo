import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.bgColor,
  });
  final void Function() onPressed;
  final String buttonText;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          buttonText,
          style: TextStyle(
            color: bgColor == kWhite ? kBlack : kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
