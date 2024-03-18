import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/domaina/review.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/domaina/wishlist.dart';
import 'package:gestapo/presentations/user/home/review_screen/review_screen.dart';

class BrandMainDetailsCard extends StatelessWidget {
  BrandMainDetailsCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.productName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder(
              stream: Wishlist.getWishList(user!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox();
                } else if (snapshot.hasData) {
                  final wishlist = snapshot.data;

                  return GestureDetector(
                    onTap: () async {
                      if (wishlist
                          .where(
                              (item) => item.productName == product.productName)
                          .isEmpty) {
                        await Wishlist.addToWishList(user!, product);
                        Utils.customSnackbar(
                          context: context,
                          text: '${product.productName} added to Wishlist',
                          type: AnimatedSnackBarType.success,
                        );
                        log('added to Wishlist');
                      } else {
                        await Wishlist.removeFromWishList(user!, product);
                        Utils.customSnackbar(
                          context: context,
                          text: '${product.productName} removed from Wishlist',
                          type: AnimatedSnackBarType.warning,
                        );
                        log('removed from Wishlist');
                      }
                    },
                    child: Icon(
                      (wishlist!
                              .where((item) =>
                                  item.productName == product.productName)
                              .isEmpty)
                          ? Icons.favorite_outline
                          : Icons.favorite,
                      color: AppColors.kWhite,
                      size: 25,
                    ),
                  );
                } else {
                  return const SpinKitCircle(color: AppColors.kWhite);
                }
              },
            ),
          ],
        ),
        Row(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: kSpecialGrey,
            //     borderRadius: BorderRadius.circular(9),
            //   ),
            //   child: const Padding(
            //     padding: EdgeInsets.all(5.0),
            //     child: Text('8735 Sold'),
            //   ),
            // ),
            // kWidth10,
            const Icon(
              Icons.star_half,
              color: AppColors.kWhite,
            ),
            kWidth10,
            StreamBuilder(
              stream: Review.getAllReview(productName: product.productName),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                } else if (snapshot.hasData) {
                  double reviewRating = 0;
                  final reviewsList = snapshot.data;
                  for (var review in reviewsList!) {
                    reviewRating = review.rating + reviewRating;
                  }
                  double avgReview = reviewRating / reviewsList.length;

                  return reviewsList.isEmpty
                      ? const Text(
                          'No Reviews',
                          style: TextStyle(
                            color: AppColors.kGreyLight,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ReviewScreen(
                                    reviewsList: reviewsList,
                                    avgReview: avgReview);
                              },
                            ));
                          },
                          child: Text(
                            '${avgReview} (${reviewsList.length} Reviews)',
                            style: const TextStyle(
                              color: AppColors.kGreyLight,
                            ),
                          ),
                        );
                } else {
                  return const Center(
                    child: SpinKitCircle(
                      color: AppColors.kWhite,
                      size: 10,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
