import 'package:flutter/material.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';

class MostPopularScreen extends StatelessWidget {
  const MostPopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Most Popular'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: GridView.builder(
      //     shrinkWrap: true,
      //     physics: const ScrollPhysics(),
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       crossAxisSpacing: 15,
      //       childAspectRatio: 0.62,
      //     ),
      //     itemCount: 13,
      //     itemBuilder: (context, index) {
      //       return ShoeBreifCard();
      //     },
      //   ),
      // ),
    );
  }
}
