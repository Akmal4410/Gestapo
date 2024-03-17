import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domaina/address.dart';
import 'package:gestapo/domaina/cart.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/presentations/user/cart/widgets/payment_card.dart';
import 'package:gestapo/presentations/user/navigation_screen/user_navigation_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.address,
    required this.cartItems,
    required this.promoCode,
  });

  final Address address;
  final List<Cart> cartItems;
  final int promoCode;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final userEmail = FirebaseAuth.instance.currentUser!.email;

  int getTotalAmountAndDiscount() {
    double discount = 0;
    int amount = 0;

    for (var item in widget.cartItems) {
      amount = amount + (item.price * item.cartCount);
    }
    discount = (amount / 100) * widget.promoCode;
    return amount - discount.toInt();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  final Razorpay _razorpay = Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Success');
    onPaymentSuccessfull(payment: 'Razor Pay').then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return UserNavigationScreen();
        },
      ), (route) => false);
    });
    log('item added to orders after razor pay');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Utils.customSnackbar(
      context: context,
      text: 'Couldn\'t Complete the trasactions',
      type: AnimatedSnackBarType.error,
    );

    log('Failure');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log('External wallet');
  }

  String selectedValue = 'RazorPay';

  Future<void> onPaymentSuccessfull({required String payment}) async {
    for (var item in widget.cartItems) {
      int id = DateTime.now().millisecondsSinceEpoch;
      int amount = item.price * item.cartCount;
      double discount = (amount / 100) * widget.promoCode;

      await Orders.addOrder(
        email: userEmail!,
        id: 'Order$id',
        cartItem: item,
        price: amount - discount.toInt(),
        payment: payment,
        address:
            '${widget.address.addressName} ${widget.address.addressDetails}',
      );
      await Cart.deleteCartItem(user: userEmail!, cartItem: item);
      showPaymentAlert(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Payment methods'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select the Payment ethod you want to use',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  kHeight20,
                  PaymentCard(
                    leading: Image.asset(
                      'assets/images/paypal.png',
                      width: 60,
                    ),
                    title: 'Razor Pay',
                    trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.kWhite,
                      ),
                      value: 'RazorPay',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                  kHeight20,
                  PaymentCard(
                    leading: const Icon(
                      Icons.payments_outlined,
                      color: AppColors.kWhite,
                    ),
                    title: 'Cash on Delivery',
                    trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.kWhite,
                      ),
                      value: 'COD',
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomButton(
            buttonText: 'Confirm Payment',
            onPressed: () async {
              int amount = getTotalAmountAndDiscount();
              var options = {
                'key': 'rzp_test_mkzSidhb6RgmDG',
                'amount': amount * 100,
                'name': 'Gestapo Corp.',
                'description': 'Demo',
                'prefill': {
                  'contact': '8138845540',
                  'email': 'akmalmahmoodkinan@gmail.com'
                },
                'external': {
                  'wallets': ['paytm']
                }
              };
              if (selectedValue == 'RazorPay') {
                _razorpay.open(options);
              } else {
                await onPaymentSuccessfull(payment: 'Cash on Delivery')
                    .then((value) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return UserNavigationScreen();
                    },
                  ), (route) => false);
                });
                log('item added to orders after razor pay');
              }
            },
          )
        ],
      ),
    );
  }
}

showPaymentAlert({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.kLightGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              kHeight25,
              CircleAvatar(
                backgroundColor: AppColors.kWhite,
                radius: 60,
                child: Icon(
                  Icons.shopping_cart,
                  color: AppColors.kBlack,
                  size: 30,
                ),
              ),
              kHeight25,
              Text(
                'Ordered Successul!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight25,
              Text(
                'You have successully made order',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
              kHeight25,
            ],
          ),
        ),
      );
    },
  );
}
