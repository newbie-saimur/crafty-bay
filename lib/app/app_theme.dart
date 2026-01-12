import 'package:flutter/material.dart';
import 'package:crafty_bay/app/app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
    );
  }
}