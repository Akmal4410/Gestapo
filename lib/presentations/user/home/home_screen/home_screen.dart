// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/core/widgets/offer_card.dart';
import 'package:gestapo/domaina/product.dart';
import 'package:gestapo/domaina/promocode.dart';
import 'package:gestapo/presentations/user/home/home_screen/widgets/most_popular_section.dart';
import 'package:gestapo/presentations/user/home/most_popular_screen/most_popular_screen.dart';
import 'package:gestapo/presentations/user/home/search_screen/search_screen.dart';
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
            HomeProfileHead(),
            kHeight24,
            Stack(
              children: [
                const CustomTextField(
                  hintText: 'Search',
                  icon: Icons.search,
                ),
                GestureDetector(
                  onTap: () async {
                    List<Product> allProductlist =
                        await Product.getProducts().first;

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen(allProductlist: allProductlist);
                      },
                    ));
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            FutureBuilder(
                future: PromoCode.getStreamPromoCode().first,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  } else if (snapshot.hasData) {
                    final promoList = snapshot.data!;
                    return promoList.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              kHeight24,
                              HomeHeading(
                                heading: 'Speacial Offers',
                                onTap: () async {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const SpecialOfferScreen();
                                    },
                                  ));
                                },
                              ),
                              kHeight24,
                              OfferCard(promo: promoList[0]),
                            ],
                          );
                  } else {
                    return const Center(
                        child: SpinKitCircle(color: AppColors.kWhite));
                  }
                }),
            kHeight24,
            const ShoeBrands(),
            kHeight12,
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
            kHeight24,
            const MostPopularSection(),
          ],
        ),
      ),
    );
  }
}
