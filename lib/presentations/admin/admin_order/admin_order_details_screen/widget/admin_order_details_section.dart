import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/domain/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/widget/text_row.dart';

class AdminOrdeDetailsSection extends StatelessWidget {
  const AdminOrdeDetailsSection({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRow(
                text1: 'Order No. : ${order.orderId}',
                text2: '',
              ),
              kHeight10,
              const Text(
                'Date : 16/03/222',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              TextRow(text1: order.productName, text2: '${order.price}rs'),
              kHeight10,
              Text(
                'Size : ${order.size}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              Text(
                'Qty : ${order.cartCount}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              const CommonHeading(text: 'User Details'),
              kHeight10,
              const Text('Mohammed Akmal'),
              const Text('akmalmahmoodkinan@gmail.com'),
              kHeight20,
              const CommonHeading(text: 'Shipping Address'),
              kHeight10,
              Text(order.address),
            ],
          ),
        ),
      ),
    );
  }
}
