import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/presentations/user/cart/add_promo_screen/add_promo_screen.dart';

class CheckoutPromoSection extends StatefulWidget {
  const CheckoutPromoSection({super.key, required this.onCallBackPromo});
  final void Function(int) onCallBackPromo;

  @override
  State<CheckoutPromoSection> createState() => _CheckoutPromoSectionState();
}

class _CheckoutPromoSectionState extends State<CheckoutPromoSection> {
  int promoCode = 0;

  @override
  Widget build(BuildContext context) {
    widget.onCallBackPromo(promoCode);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        const CommonHeading(text: 'Promo Code'),
        kHeight10,
        Row(
          children: [
            Expanded(
              child: promoCode == 0
                  ? const Text(
                      'Select an promo Code',
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.kLightGrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'PROMO$promoCode',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
            ),
            kWidth20,
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddPromoScreen();
                    },
                  ),
                );
                setState(() {
                  promoCode = result;
                  widget.onCallBackPromo(promoCode);
                  log(promoCode.toString());
                });
              },
              child: Container(
                height: 55,
                width: 55,
                decoration: const BoxDecoration(
                  color: AppColors.kWhite,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        kHeight25,
      ],
    );
  }
}
