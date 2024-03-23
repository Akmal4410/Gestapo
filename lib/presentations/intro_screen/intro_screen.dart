import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/core/widgets/common_button.dart';
import 'package:gestapo/presentations/login/login_screen/login_screen.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';
import 'package:get/route_manager.dart';

class IntroScreen extends StatefulWidget {
  static const String path = "/intro_screen";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController? controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  Container buildDot(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(3.h),
      height: 10.h,
      width: currentIndex == index ? 25.w : 10.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? context.colorScheme.primary
            : context.colorScheme.tertiary,
      ),
    );
  }

  List<String> contentImage = [Images.intro1, Images.intro2, Images.intro3];
  List<String> contentText(BuildContext context) => [
        context.localization.introOneMsg,
        context.localization.introTwoMsg,
        context.localization.introThreeMsg,
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: contentImage.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.68,
                      width: double.infinity,
                      child: Image.asset(
                        contentImage[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    kHeight20,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        contentText(context)[index],
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleLarge,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contentImage.length,
              (index) => buildDot(context, index),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.h),
            child: CommonButton(
              bgColor: context.colorScheme.primary,
              buttonText: currentIndex != contentImage.length - 1
                  ? context.localization.next
                  : context.localization.continu,
              onPressed: () {
                if (currentIndex == contentImage.length - 1) {
                  Get.offAllNamed(LoginScreen.path);
                }
                controller!.nextPage(
                  duration: const Duration(microseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            ),
          ),
          kHeight12,
        ],
      ),
    );
  }
}
