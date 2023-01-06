import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/presentations/user/cart/widgets/payment_card.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  Razorpay _razorpay = Razorpay();
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Failure');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log('External wallet');
  }

  var options = {
    'key': 'rzp_test_mkzSidhb6RgmDG',
    'amount': 50000,
    'name': 'AKMAL Mv Corp.',
    'description': 'Demo',
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    'external': {
      'wallets': ['paytm']
    }
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
              // int _id = new DateTime.now().millisecondsSinceEpoch;
              // log(_id.toString());

              // try {
              //   print('1');
              //   _razorpay.open(options);
              //   print('2');
              // } catch (e) {
              //   print('error');
              //   debugPrint(e.toString());
              // }
              _razorpay.open(options);
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
