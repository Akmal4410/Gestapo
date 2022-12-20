import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/presentations/user/home/notification_screen/notification_screen.dart';
import 'package:gestapo/presentations/user/home/wishlist_screen/wishlist_screen.dart';

class HomeProfileHead extends StatelessWidget {
  const HomeProfileHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/akmal.jpg'),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Good Morning 👋',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Mohammed Akmal',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const NotificationScreen();
                  },
                ));
              },
              icon: Icon(
                Icons.notifications_outlined,
                color: kWhite,
                size: 26,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return WishlistScreen();
                  },
                ));
              },
              icon: Icon(
                Icons.favorite_outline_rounded,
                color: kWhite,
                size: 26,
              ),
            )
          ],
        )
      ],
    );
  }
}
