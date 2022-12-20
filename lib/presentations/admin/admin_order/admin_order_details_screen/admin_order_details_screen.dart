import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/admin_order_details_section.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/order_image_card.dart';

class AdminOrderDetailsScreen extends StatelessWidget {
  const AdminOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kSpecialGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order Details',
          style: TextStyle(color: kSpecialGrey),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderImageCard(),
          AdminOrdeDetailsSection(),
        ],
      ),
    );
  }
}
