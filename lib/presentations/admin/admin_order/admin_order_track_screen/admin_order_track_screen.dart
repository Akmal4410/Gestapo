import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/domaina/utils.dart';

class AdminOrderTrackScreen extends StatelessWidget {
  AdminOrderTrackScreen({
    super.key,
    required this.order,
  });

  final Orders order;

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order Placed",
          textStyle: const TextStyle(color: kWhite)),
      subtitle: StepperText("Your order has been placed"),
    ),
    StepperData(
      title: StepperText("Packed", textStyle: const TextStyle(color: kWhite)),
      subtitle: StepperText("Your order is being prepared"),
    ),
    StepperData(
      title: StepperText("Out for Delivery",
          textStyle: const TextStyle(color: kWhite)),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
    ),
    StepperData(
        title: StepperText("Delivered",
            textStyle: const TextStyle(color: Colors.grey))),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Track Order'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: CommonButton(
              onPressed: () {
                Orders.cancelOrder(order: order);
                Utils.customSnackbar(
                  context: context,
                  text:
                      'Order Id : ${order.orderId} \nProduct : ${order.productName} is cancelled',
                  type: AnimatedSnackBarType.error,
                );
              },
              buttonText: 'Cancel',
              bgColor: kWhite,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kLightGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.135,
                      width: screenHeight * 0.135,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            order.image,
                          ),
                        ),
                        color: kSpecialGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    kWidth10,
                    Expanded(
                      child: Container(
                        height: screenHeight * 0.135,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.productName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(order.orderId),
                            Row(
                              children: [
                                Text('Size = ${order.size}'),
                                kWidth10,
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: kWhite,
                                ),
                                kWidth10,
                                Text('Qty = ${order.cartCount}')
                              ],
                            ),
                            Text(
                              order.price.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              kHeight25,
              const CommonHeading(text: 'Order Status Details'),
              AnotherStepper(
                activeIndex: order.deliveryProcess,
                //  gap: 50,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                activeBarColor: kWhite,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSpecialGrey,
        onPressed: () {
          int deliveryProcess = order.deliveryProcess;
          log(deliveryProcess.toString());
          Orders.updateOrderStatus(
            order: order,
            newProccess: deliveryProcess + 1,
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
