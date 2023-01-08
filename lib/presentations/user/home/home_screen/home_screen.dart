import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/offer_card.dart';
import 'package:gestapo/domain/category.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/most_popular_section.dart';
import 'package:gestapo/presentations/user/home/most_popular_screen/most_popular_screen.dart';
import 'package:gestapo/presentations/user/home/special_offer_screen/special_offer_screen.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/home_heading.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/home_profile_head.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/shoe_brands.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const HomeProfileHead(),
            kHeight25,
            const CustomTextField(
              hintText: 'Search',
              icon: Icons.search,
            ),
            kHeight25,
            HomeHeading(
              heading: 'Speacial Offers',
              onTap: () async {
                // final lisss = await Category.setAllDocumentInsideCategories();
                // log(lisss.toString());
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SpecialOfferScreen();
                  },
                ));
              },
            ),
            kHeight25,
            const OfferCard(),
            kHeight25,
            const ShoeBrands(),
            kHeight10,
            HomeHeading(
              heading: 'Most Popular',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MostPopularScreen();
                  },
                ));
              },
            ),
            kHeight25,
            const MostPopularSection(),
          ],
        ),
      ),
    );
  }
}
