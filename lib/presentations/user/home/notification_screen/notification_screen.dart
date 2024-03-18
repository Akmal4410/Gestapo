import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/promocode.dart';
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
        child: StreamBuilder(
            stream: PromoCode.getStreamPromoCode(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              } else if (snapshot.hasData) {
                final promoList = snapshot.data;
                return promoList!.isEmpty
                    ? const Center(child: Text('Something went wrong'))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          final promoCode = promoList[index];
                          return NotificationCard(promoCode: promoCode);
                        },
                        separatorBuilder: (context, index) => kHeight10,
                        itemCount: promoList.length,
                      );
              } else {
                return const Center(
                    child: SpinKitCircle(
                  color: AppColors.kWhite,
                ));
              }
            }),
      ),
    );
  }
}
