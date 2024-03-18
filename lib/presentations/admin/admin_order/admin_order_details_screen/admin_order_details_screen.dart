import 'package:flutter/material.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/admin_order_details_section.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/order_image_card.dart';
import 'package:gestapo/resources/resources.dart';

class AdminOrderDetailsScreen extends StatelessWidget {
  const AdminOrderDetailsScreen({super.key, required this.order});
  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kSpecialGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Order Details',
          //style: TextStyle(color: kSpecialGrey),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderImageCard(image: order.image),
          AdminOrdeDetailsSection(order: order),
        ],
      ),
    );
  }
}
