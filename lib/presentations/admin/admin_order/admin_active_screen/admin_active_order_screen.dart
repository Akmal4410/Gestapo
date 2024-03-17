import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/widgets/admin_order_card.dart';
import 'package:gestapo/resources/resources.dart';

class AdminActiveOrderScreen extends StatelessWidget {
  const AdminActiveOrderScreen({
    super.key,
  });

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
          List<Orders> activeOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.isCompleted == false && order.isCancelled == false) {
              activeOrderList.add(order);
            }
          }
          return activeOrderList.isEmpty
              ? const Center(
                  child: Text('There isn\'t any current orders'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = activeOrderList[index];
                    return AdminOrderCard(order: order);
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: activeOrderList.length,
                );
        } else {
          return const Center(
            child: SpinKitCircle(color: AppColors.kWhite),
          );
        }
      },
    );
  }
}
