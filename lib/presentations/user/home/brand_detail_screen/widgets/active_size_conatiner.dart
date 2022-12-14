import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class ActiveSizeContainer extends StatelessWidget {
  const ActiveSizeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: kWhite,
        shape: BoxShape.circle,
        border: Border.all(
          color: kWhite,
          width: 2.5,
        ),
      ),
      child: Center(
          child: Text(
        '41',
        style: TextStyle(fontSize: 16, color: kBackgroundColor),
      )),
    );
  }
}
