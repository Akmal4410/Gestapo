import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class BrandDescriptionCard extends StatelessWidget {
  const BrandDescriptionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Decription',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, es,',
          style: TextStyle(
            color: kGrey,
          ),
        )
      ],
    );
  }
}
