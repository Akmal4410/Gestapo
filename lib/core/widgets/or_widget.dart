import 'package:flutter/material.dart';
import 'package:gestapo/utils/utils.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
    required this.orText,
  });
  final String orText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.5,
            color: context.colorScheme.outline,
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
        Expanded(
          child: Divider(
            thickness: 1.5,
            color: context.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
