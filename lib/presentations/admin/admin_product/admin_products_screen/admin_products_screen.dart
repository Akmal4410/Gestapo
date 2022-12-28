import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domain/product.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_add_product_screen/admin_add_product_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_product_details_screen/admin_product_details_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_products_screen/widgets/addmin_product_card.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Products'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StreamBuilder<List<Product>>(
          stream: Product.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Some erorr occoured ${snapshot.toString()}');
            } else if (snapshot.hasData) {
              final products = snapshot.data;
              if (products!.isEmpty) {
                return Text('The Products list is empty');
              } else {
                return ListView(
                  children: products
                      .map((product) => ProductCard(
                            product: product,
                          ))
                      .toList(),
                );
              }
            } else {
              return SpinKitCircle(color: kWhite);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSpecialGrey,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AdminAddProductScreen();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
