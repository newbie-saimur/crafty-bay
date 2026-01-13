import 'package:flutter/material.dart';
import 'package:crafty_bay/app/app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      inputDecorationTheme: _inputDecorationThemeData,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
    );
  }

  static InputDecorationThemeData get _inputDecorationThemeData {
    return InputDecorationThemeData(
      border: _getInputBorder(),
      enabledBorder: _getInputBorder(),
      focusedBorder: _getInputBorder(),
      errorBorder: _getInputBorder(color: Colors.red),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    );
  }

  static OutlineInputBorder _getInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 1.5),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
      ),
      headlineSmall: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
