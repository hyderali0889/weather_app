import 'package:flutter/material.dart';

import 'font_sizes.dart';
import 'main_colors.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
      backgroundColor: MainColors().backgroundWhite,
      fontFamily: "Futura",
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: MainColors().backgroundBlack, fontSize: FontSizes().small),
        bodySmall: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().small),
        headlineLarge: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().xL),
        bodyMedium: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().med),
        bodyLarge: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().large),
      ));

  ThemeData darkTheme = ThemeData(
      backgroundColor: MainColors().backgroundBlack,
      fontFamily: "Futura",
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().small),
        bodySmall: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().small),
        headlineLarge: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().xL),
        bodyMedium: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().med),
        bodyLarge: TextStyle(
            color: MainColors().backgroundWhite, fontSize: FontSizes().large),
      ));
}
