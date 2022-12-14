import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhite,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
