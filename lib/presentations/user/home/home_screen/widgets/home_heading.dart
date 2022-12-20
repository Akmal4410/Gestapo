import 'package:flutter/material.dart';
import 'package:gestapo/core/widgets/common_heading.dart';

class HomeHeading extends StatelessWidget {
  const HomeHeading({
    Key? key,
    required this.heading,
    required this.onTap,
  }) : super(key: key);
  final String heading;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonHeading(text: heading),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
