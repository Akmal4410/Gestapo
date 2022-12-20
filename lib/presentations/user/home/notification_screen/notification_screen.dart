import 'package:flutter/material.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/presentations/user/home/notification_screen/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Notifications'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CommonHeading(text: 'Today'),
              kHeight10,
              NotificationCard(),
              kHeight10,
              CommonHeading(text: 'Yesterday'),
              kHeight10,
              NotificationCard(),
              kHeight10,
              NotificationCard(),
              kHeight10,
            ],
          ),
        ),
      ),
    );
  }
}
