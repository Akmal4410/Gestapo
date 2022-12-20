import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/custom_bottom_button.dart';
import 'package:gestapo/presentations/user/cart/widgets/payment_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Payment methods'),
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
                  Text(
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
                    title: 'Pay Pal',
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
              showPaymentAlert(context: context);
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
