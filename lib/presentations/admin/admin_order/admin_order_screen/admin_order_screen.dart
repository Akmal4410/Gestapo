import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/domain/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_active_screen/admin_active_order_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_completed_screen/admin_completed_order_screen.dart';

class AdminOrderScreen extends StatelessWidget {
  const AdminOrderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Orders'),
          centerTitle: false,
          bottom: const TabBar(
            indicatorColor: kWhite,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TabBarView(
            children: [
              AdminActiveOrderScreen(),
              AdminCompletedOrderScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
