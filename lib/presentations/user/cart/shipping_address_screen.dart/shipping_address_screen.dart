import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Shipping Address'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartCommonCard(
                          leadingIcon: Icons.location_on,
                          title: 'Home',
                          subTitle: 'Kinangattil(H), TVP, 679304',
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
                    kHeight20,
                    SizedBox(
                      width: double.infinity,
                      child: CommonButton(
                          onPressed: () {},
                          buttonText: 'Add New Address',
                          bgColor: kSpecialGrey),
                    )
                  ],
                ),
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
