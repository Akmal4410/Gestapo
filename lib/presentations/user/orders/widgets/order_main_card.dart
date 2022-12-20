import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class OrderMainCard extends StatelessWidget {
  const OrderMainCard({
    Key? key,
    this.isVisible = true,
    required this.deliveryType,
    required this.onTap,
    required this.orderType,
  }) : super(key: key);

  final bool isVisible;
  final String deliveryType;
  final String orderType;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(15),
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
              color: kSpecialGrey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/images/shoes.png'),
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
                    'Air Jordan 3 Retro',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text('Size = 42'),
                      kWidth10,
                      Container(
                        height: 15,
                        width: 1,
                        color: kWhite,
                      ),
                      kWidth10,
                      Text('Qty = 2')
                    ],
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: kSpecialGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(deliveryType),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1500.00',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(
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
