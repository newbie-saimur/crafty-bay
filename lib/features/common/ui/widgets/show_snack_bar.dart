import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String title, required String content, bool isError = false}) {
  Get.snackbar(
    title,
    content,
    backgroundColor: isError ? Colors.red : AppColors.themeColor,
    colorText: Colors.white,
  );
}