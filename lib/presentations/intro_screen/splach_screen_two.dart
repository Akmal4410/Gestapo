import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/core/constants.dart';
import 'package:gestapo/presentations/intro_screen/intro_screen.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class SplashScreenTwo extends StatelessWidget {
  const SplashScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _gotoIntroScreen(context);
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.splashTwo,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 25.w),
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.localization.welcome} 👋',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kWhite,
                          ),
                        ),
                        kHeight4,
                        Text(
                          context.localization.gestapo,
                          style: AppTextStyle.displayMediumLight,
                        ),
                        kHeight8,
                        Text(
                          context.localization.splashTwoMsg,
                          style: AppTextStyle.titleMediumLight,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _setPreference() async {
    await LocalStorage.instance.writeData<bool>(
      boxName: HiveBox.cacheBox,
      key: HiveKey.firstUser,
      value: true,
    );
  }

  Future<void> _gotoIntroScreen(context) async {
    await _setPreference();
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const IntroScreen();
        },
      ),
    );
  }
}
