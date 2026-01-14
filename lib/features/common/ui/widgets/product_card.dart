import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 220,
      margin: EdgeInsets.only(bottom: 12, right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: AppColors.themeColor.withValues(alpha: 0.15),
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withValues(alpha: 0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Image.asset(AssetPaths.dummyNikeShoe),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 12,
              bottom: 12,
            ),
            child: Column(
              children: [
                Text(
                  "New Year Special Shoe 30",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "${Constants.bdtCurrencySign}100",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Wrap(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          size: 18,
                          color: Colors.amber,
                        ),
                        Text(
                          "4.8",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
