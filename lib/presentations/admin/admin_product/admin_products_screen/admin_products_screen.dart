import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_add_product_screen/admin_add_product_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_products_screen/widgets/addmin_product_card.dart';
import 'package:gestapo/resources/resources.dart';

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
              return Center(
                  child: Text('Some erorr occoured ${snapshot.toString()}'));
            } else if (snapshot.hasData) {
              final products = snapshot.data;
              if (products!.isEmpty) {
                return const Center(child: Text('The Products list is empty'));
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
              return const SpinKitCircle(color: AppColors.kWhite);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kGreyDark,
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
