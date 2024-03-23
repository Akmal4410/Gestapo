import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class SsoOptionSection extends StatelessWidget {
  const SsoOptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _SsoOption(image: Images.facebook),
        _SsoOption(image: Images.google),
      ],
    );
  }
}

class _SsoOption extends StatelessWidget {
  const _SsoOption({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      width: context.width * 0.22,
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.colorScheme.outline, width: 1.5),
      ),
      child: Center(
        child: SizedBox(
          child: Image.asset(image, width: context.width * 0.07),
        ),
      ),
    );
  }
}
