//Themes settings here
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class MyThemes {
  //DARK THEME SETTINGS
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    brightness: Brightness.dark,
    fontFamily: FontFamily.urbanist,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kWhite,
      brightness: Brightness.dark,
      primary: AppColors.kWhite,
      tertiary: AppColors.kGreyLight,
    ),
    textTheme: TextTheme(
      displayMedium: AppTextStyle.displayMediumLight,
      titleLarge: AppTextStyle.titleLargeLight,
      titleMedium: AppTextStyle.titleMediumLight,
      titleSmall: AppTextStyle.titleSmallLight,
      bodyMedium: AppTextStyle.bodyMediumLight,
      bodySmall: AppTextStyle.bodySmallLight,
      labelMedium: AppTextStyle.labelMediumLight,
      labelSmall: AppTextStyle.labelSmallLight,
    ),
  );

  //LIGHT THEME SETTINGS
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kWhite,
    brightness: Brightness.light,
    fontFamily: FontFamily.urbanist,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kBlack,
      brightness: Brightness.light,
      primary: AppColors.kBlack,
      tertiary: AppColors.kGreyDark,
    ),
    textTheme: TextTheme(
      displayMedium: AppTextStyle.displayMediumDark,
      titleLarge: AppTextStyle.titleLargeDark,
      titleMedium: AppTextStyle.titleMediumDark,
      titleSmall: AppTextStyle.titleSmallDark,
      bodyMedium: AppTextStyle.bodyMediumDark,
      bodySmall: AppTextStyle.bodySmallDark,
      labelMedium: AppTextStyle.labelMediumDark,
      labelSmall: AppTextStyle.labelSmallDark,
    ),
  );
}
