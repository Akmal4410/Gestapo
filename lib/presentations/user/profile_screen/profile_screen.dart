import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.person,
          size: 50,
          color: kWhite,
        ),
      ),
    );
  }
}
