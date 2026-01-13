import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(Icons.computer, color: AppColors.themeColor, size: 34),
          ),
        ),
        const SizedBox(height: 4),
        Text("Electronics", maxLines: 1, style: TextStyle(color: AppColors.themeColor)),
      ],
    );
  }
}
