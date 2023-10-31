import 'package:clothing_market/main_wrapper.dart';
import 'package:clothing_market/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.appTheme,
    home: const MainWrapper(),
  ));
}
