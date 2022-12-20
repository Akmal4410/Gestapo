import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/user/cart/shipping_address_screen.dart/shipping_address_screen.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: kWhite,
            child: Icon(
              leadingIcon,
              color: kBlack,
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
