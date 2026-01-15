import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPriceButtonBanner extends StatelessWidget {
  const ProductPriceButtonBanner({
    super.key,
    required this.price,
    required this.buttonText,
    required this.priceLabel, required this.onTap,
  });

  final int price;
  final String priceLabel;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.decimalPattern().format(price);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withValues(alpha: .15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceLabel,
                  style: TextStyle(
                    color: Colors.black54,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${Constants.bdtCurrencySign}$formattedPrice",
                  style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 140,
              child: ElevatedButton(onPressed: onTap, child: Text(buttonText)),
            ),
          ],
        ),
      ),
    );
  }
}
