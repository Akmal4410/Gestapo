import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domain/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(review.image),
                ),
                kWidth10,
                Text(
                  review.userName,
                  style: const TextStyle(
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
                    const Icon(
                      Icons.star,
                      color: kWhite,
                      size: 20,
                    ),
                    kWidth10,
                    Text('${review.rating}')
                  ],
                ),
              ),
            ),
          ],
        ),
        kHeight10,
        Text(
          review.review,
        ),
      ],
    );
  }
}
