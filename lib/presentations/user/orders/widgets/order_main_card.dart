import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/orders.dart';

class OrderMainCard extends StatelessWidget {
  const OrderMainCard({
    Key? key,
    this.isVisible = true,
    required this.deliveryType,
    required this.onTap,
    required this.orderType,
    required this.order,
  }) : super(key: key);

  final bool isVisible;
  final String deliveryType;
  final String orderType;
  final Function() onTap;
  final Orders order;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.12,
            width: screenHeight * 0.12,
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
            child: Container(
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
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: kSpecialGrey,
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
                              color: kSpecialGrey,
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
