import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String title, required String content, bool isError = false}) {
  Get.snackbar(
    title,
    content,
    backgroundColor: isError ? Colors.red : null,
    colorText: isError ? Colors.white : null,
  );
}