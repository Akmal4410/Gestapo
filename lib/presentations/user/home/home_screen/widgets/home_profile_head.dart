import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/domaina/user.dart';
import 'package:gestapo/presentations/user/home/notification_screen/notification_screen.dart';
import 'package:gestapo/presentations/user/home/wishlist_screen/wishlist_screen.dart';

class HomeProfileHead extends StatelessWidget {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning !';
    }
    if (hour < 16) {
      return 'Good Afternoon !';
    }
    if (hour < 19) {
      return 'Good Evening !';
    }
    return 'Good Night !';
  }

  HomeProfileHead({
    Key? key,
  }) : super(key: key);
  final userEmail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<UserModel>(
            future: UserModel.getCurrentUserData(email: userEmail!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Somthing went wrong'));
              } else if (snapshot.hasData) {
                final user = snapshot.data!;
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: kBackgroundColor,
                      backgroundImage: NetworkImage(user.image),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${greeting()} 👋',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "${user.firstName} ${user.lastName}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: SpinKitCircle(
                    color: kWhite,
                  ),
                );
              }
            }),
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
              icon: const Icon(
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
              icon: const Icon(
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
