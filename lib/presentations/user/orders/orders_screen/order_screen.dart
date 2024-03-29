import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/presentations/user/orders/active_screen/active_screen.dart';
import 'package:gestapo/presentations/user/orders/completed_screen/completed_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('My Orders'),
          centerTitle: false,
          bottom: const TabBar(
            indicatorColor: AppColors.kWhite,
            tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TabBarView(
            children: [
              ActiveScreen(),
              CompletedScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
