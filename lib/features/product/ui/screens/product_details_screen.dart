import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/ui/widgets/increment_decrement_widget.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_price_button_banner.dart';
import 'package:crafty_bay/features/product/ui/widgets/custom_option_badges.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static final String name = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"), elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselSlider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Happy New Year Special Deal",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            IncrementDecrementWidget(onChange: (value) {}),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 22,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                color: AppColors.themeColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        CustomOptionBadges(
                          title: "Color",
                          values: [
                            'Black',
                            'Blue',
                            'Brown',
                            "Grey",
                            "Off-White",
                          ],
                          onSelected: (selectedIndex) {},
                        ),
                        const SizedBox(height: 8),
                        CustomOptionBadges(
                          title: "Size",
                          values: ['S', 'M', 'L', 'XL'],
                          onSelected: (selectedIndex) {},
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProductPriceButtonBanner(
            price: 1000,
            buttonText: "Add To Cart",
            priceLabel: "Price",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
