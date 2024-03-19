import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';
import 'package:gestapo/utils/utils.dart';

class OrderMainCard extends StatelessWidget {
  const OrderMainCard({
    super.key,
    this.isVisible = true,
    required this.deliveryType,
    required this.onTap,
    required this.orderType,
    required this.order,
  });

  final bool isVisible;
  final String deliveryType;
  final String orderType;
  final Function() onTap;
  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: context.height * 0.12,
            width: context.height * 0.12,
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
            child: Container(
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.kGreyDark,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      deliveryType,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ ${order.price.toString()}.00',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.kGreyDark,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              orderType,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
