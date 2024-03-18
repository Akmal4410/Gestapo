import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class ContactUsTile extends StatelessWidget {
  const ContactUsTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kLightGrey,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.kWhite,
        ),
        title: Text(title),
      ),
    );
  }
}
