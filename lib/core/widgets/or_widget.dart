import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
    required this.orText,
  }) : super(key: key);
  final String orText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.5,
            color: kBorderGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            orText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.5,
            color: kBorderGrey,
          ),
        ),
      ],
    );
  }
}
