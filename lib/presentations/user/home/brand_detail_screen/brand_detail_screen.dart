import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_description_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_main_details_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_quantity_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/brand_size_card.dart';
import 'package:gestapo/presentations/user/home/brand_detail_screen/widgets/image_card.dart';

class BrandDetailScreen extends StatelessWidget {
  const BrandDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBackgroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          ImageCard(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandMainDetailsCard(),
                  kHeight10,
                  Divider(color: kWhite),
                  BrandDescriptionCard(),
                  kHeight10,
                  BrandSizeCard(),
                  kHeight10,
                  BrandQuantityCard(),
                  kHeight10,
                  Divider(color: kWhite),
                  kHeight10,
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              color: kGrey,
                            ),
                          ),
                          Text(
                            '₹ 1500.00',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      kWidth10,
                      Expanded(
                        child: CommonButton(
                            onPressed: () {}, buttonText: 'Add to Cart'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
