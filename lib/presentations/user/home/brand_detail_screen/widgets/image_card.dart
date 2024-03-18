import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

import 'package:gestapo/core/constants.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    super.key,
    required this.images,
  });
  final List<dynamic> images;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int currentIndex = 0;

  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? AppColors.kBackgroundColor
            : AppColors.kGreyLight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        color: AppColors.kWhite,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: widget.images.length,
                onPageChanged: ((value) {
                  setState(() {
                    currentIndex = value;
                  });
                }),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                      widget.images[currentIndex],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) {
                  return buildDot(index);
                },
              ),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}
