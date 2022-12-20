import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/user/orders/track_order_screen/track_order_screen.dart';
import 'package:gestapo/presentations/user/orders/widgets/order_main_card.dart';

class ActiveScreen extends StatelessWidget {
  static const activeScreen = 'ActiveScreen';
  const ActiveScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return OrderMainCard(
          isVisible: true,
          deliveryType: 'In Delivery',
          orderType: 'Track Order',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TrackOrderScreen();
              },
            ));
          },
        );
      },
      separatorBuilder: (context, index) => kHeight20,
      itemCount: 4,
    );
  }
}
