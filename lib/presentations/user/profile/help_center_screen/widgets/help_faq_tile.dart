import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';

class HelpFAQTile extends StatelessWidget {
  const HelpFAQTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kLightGrey,
      ),
      child: const ExpansionTile(
        childrenPadding: EdgeInsets.all(10.0),
        textColor: AppColors.kWhite,
        iconColor: AppColors.kWhite,
        collapsedIconColor: AppColors.kWhite,
        title: Text('What is shoea ?'),
        children: [
          kDivider,
          kHeight10,
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
        ],
      ),
    );
  }
}
