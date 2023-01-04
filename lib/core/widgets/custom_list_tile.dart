import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

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
        color: color ?? kWhite,
      ),
      title: Text(
        text,
        style: TextStyle(color: color ?? kWhite),
      ),
      trailing: color == null
          ? Icon(
              Icons.arrow_forward_ios,
              color: color ?? kWhite,
            )
          : const SizedBox(),
    );
  }
}
