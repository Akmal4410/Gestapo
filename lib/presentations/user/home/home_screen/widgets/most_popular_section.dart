import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';
import 'package:gestapo/domaina/product.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Product.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else if (snapshot.hasData) {
          final products = snapshot.data;
          if (products!.isEmpty) {
            return const Center(child: Text('No Products'));
          } else {
            return GridView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.62,
              ),
              children: products
                  .map((product) => ShoeBreifCard(product: product))
                  .toList(),
            );
          }
        } else {
          return const SpinKitCircle(color: kWhite);
        }
      },
    );
  }
}
