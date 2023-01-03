import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/domain/category.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/brand_card.dart';

class ShoeBrands extends StatelessWidget {
  const ShoeBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Category.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Some error occured'),
            );
          } else if (snapshot.hasData) {
            List<Category> brand = [];
            final categories = snapshot.data;
            if (categories!.length >= 7) {
              brand = categories.getRange(0, 7).toList();
              brand.add(
                  Category(image: 'assets/images/more.png', category: 'More'));
            }
            if (categories.isEmpty) {
              return const Center(child: Text("The Categories are empty"));
            } else {
              return GridView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                ),
                children: (categories.length >= 7 ? brand : categories)
                    .map((brand) => BrandCard(
                          imagePath: brand.image,
                          brandName: brand.category,
                        ))
                    .toList(),
              );
            }
          } else {
            return const SpinKitCircle(color: kWhite);
          }
        });
  }
}
