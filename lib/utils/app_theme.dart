import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
      fontFamily: '',
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 38,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          headline3: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          headline4: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.blue),
          headline5: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          )));
}
