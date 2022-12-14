import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.185,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFd41122),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  '25%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Today\'s special',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7),
                Text('Get discount for every order. only valid for today')
              ],
            ),
          ),
          Expanded(
            child: Image.asset('assets/images/redShoes.jpeg'),
          ),
        ],
      ),
    );
  }
}
