import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domain/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/widgets/admin_order_card.dart';

class AdminCompletedOrderScreen extends StatelessWidget {
  const AdminCompletedOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          List<Orders> completedOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.isCompleted == true) {
              completedOrderList.add(order);
            }
          }
          return completedOrderList.isEmpty
              ? const Center(
                  child: Text('There isn\'t any current orders'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = completedOrderList[index];
                    return AdminOrderCard(order: order);
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: completedOrderList.length,
                );
        } else {
          return const Center(
            child: SpinKitCircle(color: kWhite),
          );
        }
      },
    );
  }
}
