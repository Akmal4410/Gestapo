import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/home/review_screen/widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('4.8 (577 Reviews)'),
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return const ReviewCard();
            },
            separatorBuilder: (context, index) {
              return kHeight25;
            },
            itemCount: 10,
          )),
    );
  }
}
