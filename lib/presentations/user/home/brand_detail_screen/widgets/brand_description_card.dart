import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class BrandDescriptionCard extends StatelessWidget {
  const BrandDescriptionCard({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: AppColors.kGrey,
          ),
        )
      ],
    );
  }
}
