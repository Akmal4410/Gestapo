import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/akmal.jpg'),
                ),
                kWidth10,
                Text(
                  'Mohammed Akmal',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kSpecialGrey),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: kWhite,
                      size: 20,
                    ),
                    kWidth10,
                    Text('5')
                  ],
                ),
              ),
            ),
          ],
        ),
        kHeight10,
        Text(
          'This item is very good and my son likes it very much and he wears every day',
        ),
      ],
    );
  }
}
