import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';
import 'package:gestapo/domaina/wishlist.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!.email;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
            stream: Wishlist.getWishList(user!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else if (snapshot.hasData) {
                final wishList = snapshot.data;
                if (wishList!.isEmpty) {
                  return const Center(
                    child: Text('The wishlist is empty'),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.62,
                    ),
                    itemCount: wishList.length,
                    itemBuilder: (context, index) {
                      return ShoeBreifCard(
                        product: wishList[index],
                      );
                    },
                  );
                }
              } else {
                return Center(child: SpinKitCircle(color: kWhite));
              }
            }),
      ),
    );
  }
}
