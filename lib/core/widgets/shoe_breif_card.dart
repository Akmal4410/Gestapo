import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/domaina/wishlist.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/brand_detail_screen.dart';

class ShoeBreifCard extends StatelessWidget {
  ShoeBreifCard({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BrandDetailScreen(product: product);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.images[0]),
                      ),
                      color: kSpecialGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: StreamBuilder(
                      stream: Wishlist.getWishList(user!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const SizedBox();
                        } else if (snapshot.hasData) {
                          final wishlist = snapshot.data;

                          return GestureDetector(
                            onTap: () async {
                              if (wishlist
                                  .where((item) =>
                                      item.productName == product.productName)
                                  .isEmpty) {
                                await Wishlist.addToWishList(user!, product);
                                Utils.customSnackbar(
                                  context: context,
                                  text:
                                      '${product.productName} added to Wishlist',
                                  type: AnimatedSnackBarType.success,
                                );
                                log('added to Wishlist');
                              } else {
                                await Wishlist.removeFromWishList(
                                    user!, product);
                                Utils.customSnackbar(
                                  context: context,
                                  text:
                                      '${product.productName} removed from Wishlist',
                                  type: AnimatedSnackBarType.warning,
                                );
                                log('removed from Wishlist');
                              }
                            },
                            child: Icon(
                              (wishlist!
                                      .where((item) =>
                                          item.productName ==
                                          product.productName)
                                      .isEmpty)
                                  ? Icons.favorite_outline
                                  : Icons.favorite,
                              color: Colors.red,
                              size: 25,
                            ),
                          );
                        } else {
                          return const SpinKitCircle(color: kWhite);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.productName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.star_half_rounded,
                  color: kWhite,
                ),
                const SizedBox(width: 6),
                const Text(
                  '4.5',
                ),
                const SizedBox(width: 10),
                Container(color: kWhite, width: 1, height: 15),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: kSpecialGrey,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('8735 Sold'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '₹ ${product.price}.00',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
