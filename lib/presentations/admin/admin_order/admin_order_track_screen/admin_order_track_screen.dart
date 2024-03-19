// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/domaina/utils.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class AdminOrderTrackScreen extends StatelessWidget {
  const AdminOrderTrackScreen({
    super.key,
    required this.order,
  });

  final Orders order;

  static List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order Placed",
          textStyle: const TextStyle(color: AppColors.kWhite)),
      subtitle: StepperText("Your order has been placed"),
    ),
    StepperData(
      title: StepperText("Packed",
          textStyle: const TextStyle(color: AppColors.kWhite)),
      subtitle: StepperText("Your order is being prepared"),
    ),
    StepperData(
      title: StepperText("Out for Delivery",
          textStyle: const TextStyle(color: AppColors.kWhite)),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
    ),
    StepperData(
        title: StepperText("Delivered",
            textStyle: const TextStyle(color: Colors.grey))),
  ];

  @override
  Widget build(BuildContext context) {
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
              bgColor: AppColors.kWhite,
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
                  color: AppColors.kLightGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      height: context.height * 0.135,
                      width: context.height * 0.135,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            order.image,
                          ),
                        ),
                        color: AppColors.kGreyDark,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    kWidth12,
                    Expanded(
                      child: Container(
                        height: context.height * 0.135,
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
                                kWidth12,
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: AppColors.kWhite,
                                ),
                                kWidth12,
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
              kHeight24,
              const CommonHeading(text: 'Order Status Details'),
              AnotherStepper(
                activeIndex: order.deliveryProcess,
                //  gap: 50,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                activeBarColor: AppColors.kWhite,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kGreyDark,
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
