import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductCategoryItem extends StatefulWidget {
  const ProductCategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.productListScreen, arguments: widget.category);
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
              child: Image.network(
                widget.category.iconUrl,
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset(
                    AssetPaths.appLogoSvg,
                    width: 34,
                    height: 34,
                  );
                },
                height: 34,
                width: 34,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            getTitle(widget.category.title),
            maxLines: 1,
            style: TextStyle(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }

  String getTitle(String title) {
    return title.length > 9 ? "${title.substring(0, 8)}.." : title;
  }
}
