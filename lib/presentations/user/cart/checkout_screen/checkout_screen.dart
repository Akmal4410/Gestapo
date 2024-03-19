import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domaina/address.dart';
import 'package:gestapo/domaina/cart.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_address_section.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_order_section.dart';
import 'package:gestapo/presentations/user/cart/checkout_screen/widgets/checkout_promo_section.dart';
import 'package:gestapo/presentations/user/cart/payment_screen/payment_screen.dart';
import 'package:gestapo/presentations/user/cart/widgets/price_card.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    super.key,
    required this.cartItems,
  });
  final List<Cart> cartItems;

  Address address = Address(addressName: '', addressDetails: '');
  ValueNotifier<int> promoCode = ValueNotifier(0);

  void getAddress(Address _address) {
    address = _address;
  }

  void getPromoCode(int _promoCode) {
    promoCode.value = _promoCode;
  }

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
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
                    CheckoutAddressSection(callBackAddress: getAddress),
                    kDivider,
                    CheckoutOrderSection(cartItems: cartItems),
                    kDivider,
                    CheckoutPromoSection(onCallBackPromo: getPromoCode),
                    ValueListenableBuilder(
                      valueListenable: promoCode,
                      builder: (BuildContext context, int promo, Widget? _) {
                        return PriceCard(
                          cartItems: cartItems,
                          promoCode: promoCode.value,
                        );
                      },
                    ),
                    kHeight24,
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
                  return PaymentScreen(
                    address: address,
                    cartItems: cartItems,
                    promoCode: promoCode.value,
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
