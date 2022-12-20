import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';

class AddPromoCard extends StatelessWidget {
  const AddPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add Promo'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CartCommonCard(
                    leadingIcon: Icons.percent,
                    title: 'Special 25% off',
                    subTitle: 'Special promo only today',
                    trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => kWhite,
                      ),
                      value: false,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                  );
                },
                separatorBuilder: (context, index) => kHeight20,
                itemCount: 3,
              ),
            ),
          ),
          CustomBottomButton(
            buttonText: 'Apply',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
