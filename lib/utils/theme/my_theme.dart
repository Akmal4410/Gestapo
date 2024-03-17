//Themes settings here
import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';

class MyThemes {
  //DARK THEME SETTINGS
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );

  //light THEME SETTINGS
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: AppColors.kWhite,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );
}
