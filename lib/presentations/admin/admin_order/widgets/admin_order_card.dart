import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_details_screen/admin_order_details_screen.dart';
import 'package:gestapo/presentations/admin/admin_order/admin_order_track_screen/admin_order_track_screen.dart';

class AdminOrderCard extends StatelessWidget {
  const AdminOrderCard({
    Key? key,
    this.isActive = true,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return AdminOrderDetailsScreen();
          },
        ));
      },
      child: Container(
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
                        Text('Order ID : 001'),
                        kWidth10,
                        Container(
                          height: 15,
                          width: 1,
                          color: kWhite,
                        ),
                        kWidth10,
                        Text('User ID = 001')
                      ],
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
                          visible: isActive,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AdminOrderTrackScreen();
                                },
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: kSpecialGrey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Track Order',
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
