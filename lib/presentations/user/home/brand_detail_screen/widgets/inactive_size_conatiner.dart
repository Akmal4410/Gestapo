import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class InactiveSizeContainer extends StatelessWidget {
  const InactiveSizeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: kSpecialGrey,
          width: 2.5,
        ),
      ),
      child: Center(
          child: Text(
        '40',
        style: TextStyle(fontSize: 16, color: kWhite),
      )),
    );
  }
}
