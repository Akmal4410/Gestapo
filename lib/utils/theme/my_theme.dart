//Themes settings here
import 'package:flutter/material.dart';
import 'package:gestapo/core/colors.dart';

class MyThemes {
  //DARK THEME SETTINGS
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );

  //light THEME SETTINGS
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: kWhite,
        fontFamily: 'Poppins',
      ),
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
      ),
    ),
  );
}
