import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/review.dart';
import 'package:gestapo/presentations/user/home/review_screen/widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen(
      {super.key, required this.reviewsList, required this.avgReview});
  final List<Review> reviewsList;
  final double avgReview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('${avgReview} (${reviewsList.length} Reviews)'),
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final review = reviewsList[index];
              return ReviewCard(review: review);
            },
            separatorBuilder: (context, index) {
              return kHeight25;
            },
            itemCount: reviewsList.length,
          )),
    );
  }
}
