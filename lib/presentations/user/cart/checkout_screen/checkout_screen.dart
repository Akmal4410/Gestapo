import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/presentations/user/cart/add_promo_screen/add_promo_screen.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_address_section.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_order_section.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_promo_section.dart';
import 'package:gestapo/presentations/user/cart/payment_screen/payment_screen.dart';
import 'package:gestapo/presentations/user/cart/widgets/price_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.cartItems,
  });
  final List<Cart> cartItems;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text('Checkout'),
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
                    CheckoutAddressSection(),
                    kDivider,
                    CheckoutOrderSection(cartItems: widget.cartItems),
                    kDivider,
                    CheckoutPromoSection(),
                    const PriceCard(),
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
                  return const PaymentScreen();
                },
              ));
            },
          )
        ],
      ),
    );
  }
}
