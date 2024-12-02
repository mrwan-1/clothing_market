import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      fontFamily: '',
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 38,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          displaySmall: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
          headlineSmall: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          )));
}
