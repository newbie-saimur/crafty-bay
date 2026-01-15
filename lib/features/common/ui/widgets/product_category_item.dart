import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name, arguments: "Computer");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.computer, color: AppColors.themeColor, size: 34),
            ),
          ),
          const SizedBox(height: 4),
          Text("Electronics", maxLines: 1, style: TextStyle(color: AppColors.themeColor)),
        ],
      ),
    );
  }
}
