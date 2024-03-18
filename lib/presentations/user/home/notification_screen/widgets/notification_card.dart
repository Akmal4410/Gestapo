import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/domaina/promocode.dart';
import 'package:gestapo/utils/utils.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.promoCode,
  });

  final PromoCode promoCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.12,
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: context.width * 0.09,
              backgroundColor: AppColors.kWhite,
              child: const Icon(
                Icons.person_rounded,
                color: AppColors.kBackgroundColor,
                size: 30,
              ),
            ),
            kWidth10,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${promoCode.promo}% Special Discount',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  promoCode.details,
                  style: const TextStyle(color: AppColors.kGrey),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
