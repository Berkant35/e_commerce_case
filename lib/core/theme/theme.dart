import 'package:flutter/material.dart';
import '../constants/color.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: CustomColor.primaryColor,
  scaffoldBackgroundColor: CustomColor.backgroundColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.secondaryTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.secondaryTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor,
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: CustomColor.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: CustomColor.primaryTextColor,
      backgroundColor: CustomColor.primaryColor,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: CustomColor.primaryColor,
    inactiveTrackColor: CustomColor.dividerColor,
    thumbColor: CustomColor.secondaryColor,
    overlayColor: CustomColor.primaryColor.withOpacity(0.1),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColor.backgroundColor,
    selectedItemColor: CustomColor.primaryColor,
    unselectedItemColor: CustomColor.secondaryTextColor,
  ),
);
