import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domain/product.dart';
import 'package:gestapo/domain/utils.dart';
import 'package:gestapo/domain/wishlist.dart';
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
                      color: kWhite,
                      size: 25,
                    ),
                  );
                } else {
                  return const SpinKitCircle(color: kWhite);
                }
              },
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kSpecialGrey,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('8735 Sold'),
              ),
            ),
            kWidth10,
            Icon(
              Icons.star_half,
              color: kWhite,
            ),
            kWidth10,
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ReviewScreen();
                  },
                ));
              },
              child: const Text(
                '4.9(6,573 Reviews)',
                style: TextStyle(
                  color: kGrey,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
