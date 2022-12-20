import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/common_heading.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);
  final Widget leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: ListTile(
          leading: leading,
          title: CommonHeading(text: title),
          trailing: Radio(
            fillColor: MaterialStateColor.resolveWith(
              (states) => kWhite,
            ),
            value: false,
            groupValue: true,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
