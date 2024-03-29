import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/admin_order_details_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_track_screen/admin_order_track_screen.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class AdminOrderCard extends StatelessWidget {
  const AdminOrderCard({
    super.key,
    required this.order,
  });

  final Orders order;

  @override
  Widget build(BuildContext context) {
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
          color: AppColors.kLightGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              height: context.height * 0.135,
              width: context.height * 0.135,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    order.image,
                  ),
                ),
                color: AppColors.kGreyDark,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            kWidth12,
            Expanded(
              child: SizedBox(
                height: context.height * 0.135,
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
                        kWidth12,
                        Container(
                          height: 15,
                          width: 1,
                          color: AppColors.kWhite,
                        ),
                        kWidth12,
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
                                color: AppColors.kGreyDark,
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
