import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';
import 'package:gestapo/domain/product.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(brand),
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
        child: FutureBuilder(
          future: Product.getProducts().first,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.hasData) {
              List<Product> brandProducts = [];
              final product = snapshot.data;
              if (product!.isEmpty) {
                return Center(child: Text('Currently no produsts for $brand'));
              }
              for (var item in product) {
                if (item.category == brand) {
                  brandProducts.add(item);
                }
              }
              if (brandProducts.isEmpty) {
                return Center(child: Text('Currently no produsts for $brand'));
              } else {
                return GridView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.62,
                  ),
                  children: brandProducts
                      .map(
                        (product) => ShoeBreifCard(product: product),
                      )
                      .toList(),
                );
              }
            } else {
              return const SpinKitCircle(color: kWhite);
            }
          },
        ),
      ),
    );
  }
}
