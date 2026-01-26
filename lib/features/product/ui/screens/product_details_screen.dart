import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/increment_decrement_widget.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_price_button_banner.dart';
import 'package:crafty_bay/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/product/ui/widgets/custom_option_badges.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final ProductDetailsController _productDetailsController;

  @override
  void initState() {
    super.initState();
    _productDetailsController = Get.put(
      ProductDetailsController(),
      tag: widget.productId,
    );
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"), elevation: 0),
      body: GetBuilder<ProductDetailsController>(
        tag: widget.productId,
        builder: (controller) {
          if (controller.inProgress == true ||
              controller.productDetails == null) {
            return CenteredCircularProgressIndicator();
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarouselSlider(
                        imageList: controller.productDetails!.photoUrls,
                      ),
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
                                    controller.productDetails!.title,
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
                                  padding: EdgeInsets.all(3),
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
                            if (controller.productDetails!.colors.isNotEmpty)
                              Column(
                                children: [
                                  const SizedBox(height: 8),
                                  CustomOptionBadges(
                                    title: "Color",
                                    values: controller.productDetails!.colors,
                                    onSelected: (selectedIndex) {},
                                  ),
                                ],
                              ),
                            if (controller.productDetails!.sizes.isNotEmpty)
                              Column(
                                children: [
                                  const SizedBox(height: 8),
                                  CustomOptionBadges(
                                    title: "Size",
                                    values: controller.productDetails!.sizes,
                                    onSelected: (selectedIndex) {},
                                  ),
                                ],
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
                              controller.productDetails!.description,
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
                price: controller.productDetails!.currentPrice!,
                buttonText: "Add To Cart",
                priceLabel: "Price",
                onTap: _onTapAddToCartButton,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _onTapAddToCartButton() async {
    bool isLoggedIn = await Get.find<AuthController>().isUserLoggedIn();
    if (isLoggedIn) {
      Get.back();
      Get.find<MainBottomNavBarController>().moveToCartScreen();
    } else {
      Get.toNamed(RouteNames.loginScreen);
    }
  }

  @override
  void dispose() {
    Get.delete<ProductDetailsController>(tag: widget.productId);
    super.dispose();
  }
}
