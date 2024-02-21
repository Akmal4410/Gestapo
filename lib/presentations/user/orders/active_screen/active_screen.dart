import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/presentations/user/orders/track_order_screen/track_order_screen.dart';
import 'package:gestapo/presentations/user/orders/widgets/order_main_card.dart';

class ActiveScreen extends StatelessWidget {
  static const activeScreen = 'ActiveScreen';
  ActiveScreen({
    Key? key,
  }) : super(key: key);
  final userEmail = FirebaseAuth.instance.currentUser!.email;

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
          List<Orders> userOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.userEmail == userEmail) {
              if (order.isCompleted == false && order.isCancelled == false) {
                userOrderList.add(order);
              }
            }
          }
          return userOrderList.isEmpty
              ? const Center(
                  child: Text('There isn\'t any current orders'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = userOrderList[index];
                    return OrderMainCard(
                      order: order,
                      isVisible: true,
                      deliveryType: 'In Delivery',
                      orderType: 'Track Order',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TrackOrderScreen(
                              order: order,
                            );
                          },
                        ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: userOrderList.length,
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
