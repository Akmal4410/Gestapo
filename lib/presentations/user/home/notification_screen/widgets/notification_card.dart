import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.12,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.09,
              backgroundColor: kWhite,
              child: Icon(
                Icons.person_rounded,
                color: kBackgroundColor,
                size: 30,
              ),
            ),
            kWidth10,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '30% Special Discount',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Special Promotion only valid today',
                  style: TextStyle(color: kGrey),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
