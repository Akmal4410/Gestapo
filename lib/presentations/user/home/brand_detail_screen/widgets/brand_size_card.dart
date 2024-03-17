import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';

class BrandSizeCard extends StatefulWidget {
  const BrandSizeCard({
    Key? key,
    required this.sizes,
    required this.selectSize,
  }) : super(key: key);
  final List<String> sizes;
  final void Function(int) selectSize;

  @override
  State<BrandSizeCard> createState() => _BrandSizeCardState();
}

class _BrandSizeCardState extends State<BrandSizeCard> {
  int selectesIndex = 0;

  Widget sizeContainer(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectesIndex = index;
          widget.selectSize(int.parse(widget.sizes[selectesIndex]));
        });
      },
      child: Container(
        width: 42,
        height: 42,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selectesIndex == index
              ? AppColors.kWhite
              : AppColors.kBackgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectesIndex == index
                ? AppColors.kWhite
                : AppColors.kSpecialGrey,
            width: 2.5,
          ),
        ),
        child: Center(
          child: Text(
            widget.sizes[index],
            style: TextStyle(
              fontSize: 16,
              color: selectesIndex == index
                  ? AppColors.kBackgroundColor
                  : AppColors.kWhite,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    widget.selectSize(int.parse(widget.sizes[selectesIndex]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight10,
        Row(
          children: List.generate(
            widget.sizes.length,
            (index) => sizeContainer(index),
          ),
        ),
      ],
    );
  }
}
