import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class CartCommonCard extends StatelessWidget {
  CartCommonCard({
    Key? key,
    required this.trailing,
    required this.title,
    required this.subTitle,
    required this.leadingIcon,
  }) : super(key: key);

  final Widget trailing;
  final String title;
  final String subTitle;
  final IconData leadingIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: AppColors.kWhite,
            child: Icon(
              leadingIcon,
              color: AppColors.kBlack,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 17),
          ),
          subtitle: Text(subTitle),
          trailing: trailing,
        ),
      ),
    );
  }
}
