import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.onTap,
    required this.leading,
    required this.text,
    this.color,
  }) : super(key: key);
  final Function() onTap;
  final IconData leading;
  final Color? color;

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leading,
        color: color ?? AppColors.kWhite,
      ),
      title: Text(
        text,
        style: TextStyle(color: color ?? AppColors.kWhite),
      ),
      trailing: color == null
          ? Icon(
              Icons.arrow_forward_ios,
              color: color ?? AppColors.kWhite,
            )
          : const SizedBox(),
    );
  }
}
