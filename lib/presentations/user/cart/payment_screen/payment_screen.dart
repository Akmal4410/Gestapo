import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/presentations/user/cart/widgets/payment_card.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  Razorpay _razorpay = Razorpay();
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  var options = {
    'key': 'rzp_test_z8aKggxY5VTzKH',
    'amount': 50000, //in the smallest currency sub-unit.
    'name': 'Gestapo',
    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
    'description': 'Fine T-Shirt',
    'timeout': 60, // in seconds
    'prefill': {'contact': '8138845540', 'email': 'akmalmahmoodkinan@gmail.com'}
  };

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
                  ),
                  kHeight20,
                  const PaymentCard(
                    leading: Icon(
                      Icons.payments_outlined,
                      color: kWhite,
                    ),
                    title: 'Cash on Delivery',
                  ),
                ],
              ),
            ),
          ),
          CustomBottomButton(
            buttonText: 'Confirm Payment',
            onPressed: () {
              // showPaymentAlert(context: context);
              int _id = new DateTime.now().millisecondsSinceEpoch;
              log(_id.toString());

              // var options = {
              //   'key': 'rzp_test_z8aKggxY5VTzKH',
              //   'amount': 50000, //in the smallest currency sub-unit.
              //   'name': 'GESTAPO',
              //   'order_id': 'Order_$_id', // Generate order_id using Orders API
              //   'description': 'Ordered from GESTAPO',
              //   'timeout': 300, // in seconds
              //   'prefill': {
              //     'contact': '8138845540',
              //     'email': 'akmalmahmoodkinan@gmail.com'
              //   }
              // };
              var options = {
                'key': 'rzp_test_W778OTIAt9ZppG',
                'amount': 50000, //in the smallest currency sub-unit.
                'name': 'Acme Corp.',
                'order_id':
                    'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                'description': 'Fine T-Shirt',
                'timeout': 1000, // in seconds
                'prefill': {
                  'contact': '9123456789',
                  'email': 'gaurav.kumar@example.com'
                }
              };

              try {
                print('1');
                _razorpay.open(options);
                print('2');
              } catch (e) {
                print('error');
                debugPrint(e.toString());
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
            color: kLightGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              kHeight25,
              CircleAvatar(
                backgroundColor: kWhite,
                radius: 60,
                child: Icon(
                  Icons.shopping_cart,
                  color: kBlack,
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
