import 'package:clothing_market/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Home(),
    ));
