import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/admin_order_details_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_track_screen/admin_order_track_screen.dart';

class AdminOrderCard extends StatelessWidget {
  const AdminOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Orders order;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AdminOrderDetailsScreen(order: order);
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kLightGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              height: screenHeight * 0.135,
              width: screenHeight * 0.135,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    order.image,
                  ),
                ),
                color: kSpecialGrey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            kWidth10,
            Expanded(
              child: SizedBox(
                height: screenHeight * 0.135,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.productName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(order.orderId),
                    Row(
                      children: [
                        Text('Size = ${order.size}'),
                        kWidth10,
                        Container(
                          height: 15,
                          width: 1,
                          color: kWhite,
                        ),
                        kWidth10,
                        Text('Qty = ${order.cartCount}')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ ${order.price.toString()}.00',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: !order.isCompleted,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AdminOrderTrackScreen(order: order);
                                },
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: kSpecialGrey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'Track',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
