import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/domain/address.dart';
import 'package:gestapo/domain/cart.dart';
import 'package:gestapo/presentations/user/cart/widgets/payment_card.dart';
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
  double discount = 0;

  int getTotalAmountAndDiscount() {
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

  String selectedValue = 'Razor Pay';

  onPayment({required int amount}) {
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
                        (states) => kWhite,
                      ),
                      value: 'Razor Pay',
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
                      color: kWhite,
                    ),
                    title: 'Cash on Delivery',
                    trailing: Radio(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => kWhite,
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
            onPressed: () {
              int amount = getTotalAmountAndDiscount();

              // showPaymentAlert(context: context);
              // int _id = new DateTime.now().millisecondsSinceEpoch;
              // log(_id.toString());

              //_razorpay.open(options);

              log('address : ${widget.address.addressName}');
              log('amount $amount');
              log('cartItems: ${widget.cartItems}');
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
