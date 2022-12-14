import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.wallet,
          size: 50,
          color: kWhite,
        ),
      ),
    );
  }
}
