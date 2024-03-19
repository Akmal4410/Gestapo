import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/shoe_breif_card.dart';
import 'package:gestapo/domaina/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.allProductlist});
  final List<Product> allProductlist;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? searchProductList;

  @override
  void initState() {
    searchProductList =
        List.from(widget.allProductlist).cast<Product>().toList();
    super.initState();
  }

  void searchProduct(String value) {
    setState(() {
      searchProductList = widget.allProductlist
          .where((product) => product.productName.contains(value.trim()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Search'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Search',
              icon: Icons.search,
              onChanged: (value) {
                searchProduct(value!);
              },
            ),
            kHeight12,
            (searchProductList!.isEmpty)
                ? const Expanded(
                    child: Center(
                      child: Text("The list is empty"),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.62,
                      ),
                      itemCount: searchProductList!.length,
                      itemBuilder: (context, index) {
                        final product = searchProductList![index];
                        return ShoeBreifCard(product: product);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
