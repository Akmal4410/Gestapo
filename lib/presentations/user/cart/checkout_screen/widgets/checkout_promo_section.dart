import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_heading.dart';
import 'package:gestapo/core/widgets/custom_text_field.dart';
import 'package:gestapo/domain/promocode.dart';
import 'package:gestapo/presentations/user/cart/add_promo_screen/add_promo_screen.dart';

class CheckoutPromoSection extends StatelessWidget {
  CheckoutPromoSection({super.key});
  final promoCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        const CommonHeading(text: 'Promo Code'),
        kHeight10,
        StreamBuilder(
            stream: PromoCode.getStreampromoCode(),
            builder: (context, snapshot) {
              final promoList = snapshot.data;
              List<String> promCodes = [];
              if (promoList == null) {
                return SpinKitCircle(color: kWhite);
              }
              for (var code in promoList) {
                promCodes.add('Promo${code.promo}');
              }
              log(promCodes.toString());
              return Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: CustomTextField(
                        controller: promoCodeController,
                        hintText: 'Enter Promo code',
                        icon: Icons.percent,
                        validator: (promoCode) {
                          if (promoCode != null && promoCode.isEmpty) {
                            return 'Enter a valid Promocode';
                          } else if (!promCodes.contains(promoCode)) {
                            return 'This promo code doesnot exist';
                          } else {
                            return null;
                          }
                        },
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
                            return AddPromoScreen(promoCodeList: promoList);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        color: kWhite,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              );
            }),
        kHeight25,
      ],
    );
  }
}
