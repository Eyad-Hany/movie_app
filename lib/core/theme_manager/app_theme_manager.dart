import 'package:flutter/material.dart';
import 'collor_pallete.dart';

abstract class AppThemeManager{
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorPallete.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              size: 35
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorPallete.generalTextColor,
          )
      ),
      textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorPallete.generalTextColor,
          ),
          titleLarge: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: ColorPallete.generalTextColor,
          ),
          titleMedium: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: ColorPallete.generalTextColor,
          ),
          titleSmall: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: ColorPallete.generalTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: ColorPallete.generalTextColor,
          ),

      )
  );
}