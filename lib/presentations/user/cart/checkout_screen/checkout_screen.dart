import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/presentations/user/cart/add_promo_screen/add_promo_screen.dart';
import 'package:gestapo/presentations/user/cart/payment_screen/payment_screen.dart';
import 'package:gestapo/presentations/user/cart/shipping_address_screen.dart/shipping_address_screen.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_common_card.dart';
import 'package:gestapo/presentations/user/cart/widgets/cart_item.dart';
import 'package:gestapo/presentations/user/cart/widgets/price_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonHeading(text: 'Shipping Address'),
                    kHeight25,
                    CartCommonCard(
                      leadingIcon: Icons.location_on,
                      title: 'Home',
                      subTitle: 'Kinangattil(H), TVP, 679304',
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ShippingAddressScreen();
                            },
                          ));
                        },
                        child: Icon(
                          Icons.edit,
                          color: kWhite,
                        ),
                      ),
                    ),
                    kHeight20,
                    kDivider,
                    kHeight10,
                    CommonHeading(text: 'Order List'),
                    kHeight20,
                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   physics: ScrollPhysics(),
                    //   itemBuilder: (context, index) {
                    //     return CartItem(
                    //       bgColor: kLightGrey,
                    //       isVisible: false,
                    //     );
                    //   },
                    //   separatorBuilder: (context, index) => kHeight20,
                    //   itemCount: 4,
                    // ),
                    kDivider,
                    kHeight10,
                    CommonHeading(text: 'Promo Code'),
                    kHeight10,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Enter Promo code',
                            icon: Icons.percent,
                          ),
                        ),
                        kWidth20,
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return AddPromoCard();
                              },
                            ));
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: kWhite,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    kHeight25,
                    PriceCard(),
                    kHeight25,
                  ],
                ),
              ),
            ),
          ),
          CustomBottomButton(
            buttonText: 'Continue to Payment',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return PaymentScreen();
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
