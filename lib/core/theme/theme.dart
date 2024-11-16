import 'package:flutter/material.dart';

import '../constants/color.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: CustomColor.primaryColor, // Temel renk
  scaffoldBackgroundColor: CustomColor.backgroundColor, // Sayfa arka plan rengi
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor, // Büyük başlık rengi
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor, // Orta büyüklükte başlık rengi
    ),
    displaySmall: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor, // Küçük başlık rengi
    ),
    headlineLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.secondaryTextColor, // Büyük başlık rengi
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.secondaryTextColor, // Orta büyüklükte başlık rengi
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor, // Küçük başlık rengi
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor, // Büyük başlık rengi
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: CustomColor.primaryTextColor, // Orta büyüklükte başlık rengi
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor, // Küçük başlık rengi
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor, // Büyük metin rengi
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.primaryTextColor, // Orta büyüklükte metin rengi
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: CustomColor.secondaryTextColor, // Küçük metin rengi
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: CustomColor.primaryColor, // Buton arka plan rengi
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Radius değeri
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: CustomColor.primaryTextColor, // Buton yazı rengi
      backgroundColor: CustomColor.primaryColor, // Buton arka plan rengi
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Radius değeri
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: CustomColor.primaryColor, // Slider aktif renk
    inactiveTrackColor: CustomColor.dividerColor, // Slider inaktif renk
    thumbColor: CustomColor.secondaryColor, // Thumb (daire) rengi
    overlayColor: CustomColor.primaryColor.withOpacity(0.1), // Thumb hover efekti
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: CustomColor.backgroundColor,
    selectedItemColor: CustomColor.primaryColor,
    unselectedItemColor: CustomColor.secondaryTextColor,
  ),
);
