import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/offer_card.dart';
import 'package:gestapo/domaina/promocode.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Special Offers'),
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
                final promoList = snapshot.data!;
                return promoList.isEmpty
                    ? const Center(
                        child: Text('No Special offers'),
                      )
                    : ListView.separated(
                        itemCount: promoList.length,
                        separatorBuilder: (context, index) => kHeight25,
                        itemBuilder: (context, index) {
                          final promo = promoList[index];
                          return OfferCard(promo: promo);
                        },
                      );
              } else {
                return const Center(
                    child: SpinKitCircle(color: AppColors.kWhite));
              }
            }),
      ),
    );
  }
}
