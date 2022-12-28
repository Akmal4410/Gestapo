import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('My Wishlist'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kWhite,
              size: 30,
            ),
          ),
          kWidth10,
        ],
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
