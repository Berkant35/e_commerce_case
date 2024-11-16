import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  // Temel renk (background-color:#000000)
  scaffoldBackgroundColor: Colors.white,
  // Sayfa arka plan rengi
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Büyük başlık rengi
    ),
    displayMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Orta büyüklükte başlık rengi
    ),
    displaySmall: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.normal,
      color: Colors.white, // Küçük başlık rengi
    ),
    headlineLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Büyük başlık rengi
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Orta büyüklükte başlık rengi
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white, // Küçük başlık rengi
    ),
    titleLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Büyük başlık rengi
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Orta büyüklükte başlık rengi
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.white, // Küçük başlık rengi
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.black, // Büyük metin rengi
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black, // Orta büyüklükte metin rengi
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black, // Küçük metin rengi
    ),
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
    // Buton arka plan rengi (background-color:#FFFFFF)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Radius değeri
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white, // Buton arka plan rengi
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Radius değeri
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.black, // Slider aktif renk
    inactiveTrackColor: Colors.grey, // Slider inaktif renk
    thumbColor: Colors.white, // Thumb (daire) rengi
    overlayColor: Colors.black.withOpacity(0.1), // Thumb hover efekti
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
);
