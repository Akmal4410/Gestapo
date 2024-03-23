import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "AppLogo",
      child: Image.asset(
        Images.appLogo,
        width: context.width * 0.40,
      ),
    );
  }
}
