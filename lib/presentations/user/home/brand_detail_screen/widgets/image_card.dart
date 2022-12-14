import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';
import 'package:gestapo/core/constants.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  int currentIndex = 0;
  List<String> images = [
    'assets/images/nike1.jpg',
    'assets/images/nike2.jpg',
    'assets/images/nike3.jpg',
  ];

  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? kBackgroundColor : kGrey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        color: kWhite,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: ((value) {
                  setState(() {
                    currentIndex = value;
                  });
                }),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      images[currentIndex],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
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
