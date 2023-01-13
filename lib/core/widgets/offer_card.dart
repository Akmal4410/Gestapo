import 'package:flutter/material.dart';
import 'package:gestapo/domain/promocode.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.promo,
  }) : super(key: key);

  final PromoCode promo;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.185,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(int.parse(promo.color)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  '${promo.promo}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Today\'s special',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 7),
                Text(promo.details)
              ],
            ),
          ),
          Expanded(
            child: Image.network(promo.image),
          ),
        ],
      ),
    );
  }
}
