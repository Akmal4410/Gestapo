import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_add_product_screen/admin_add_product_screen.dart';
import 'package:gestapo/presentations/admin/admin_product/admin_product_details_screen/admin_product_details_screen.dart';

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
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ProductCard();
          },
          separatorBuilder: (context, index) => kHeight20,
          itemCount: 5,
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

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AdminProductDetailsScreen();
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: screenHeight * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset('assets/images/shoes.png'),
            ),
            kWidth10,
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonHeading(text: 'Air Jordan retro 3'),
                  Text(
                    '₹ 1500',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
