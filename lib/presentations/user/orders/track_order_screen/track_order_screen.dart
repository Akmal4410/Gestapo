import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domain/orders.dart';
import 'package:gestapo/presentations/user/orders/widgets/order_main_card.dart';

class TrackOrderScreen extends StatelessWidget {
  final Orders order;

  TrackOrderScreen({super.key, required this.order});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Track Order'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderMainCard(
                order: order,
                orderType: '',
                deliveryType: 'In Delivery',
                onTap: () {},
                isVisible: false,
              ),
              kHeight25,
              const CommonHeading(text: 'Order Status Details'),
              AnotherStepper(
                activeIndex: order.deliveryProcess,
                verticalGap: 50,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                activeBarColor: kWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
