import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/admin/admin_order/widgets/admin_order_card.dart';

class AdminActiveOrderScreen extends StatelessWidget {
  const AdminActiveOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return AdminOrderCard();
      },
      separatorBuilder: (context, index) => kHeight20,
      itemCount: 5,
    );
  }
}
