import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/home/ui/controllers/hero_banner_carousel_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/hero_banner_carousel_slider.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:crafty_bay/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              ProductSearchBar(),
              const SizedBox(height: 12),
              GetBuilder<HeroBannerCarouselController>(
                builder: (sliderController) {
                  if (sliderController.errorMessage != null) {
                    return SizedBox(
                      height: 198,
                      child: Center(
                        child: Text(
                          sliderController.errorMessage!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }
                  return Visibility(
                    visible: sliderController.inProgress == false,
                    replacement: SizedBox(
                      height: 198,
                      child: CenteredCircularProgressIndicator(),
                    ),
                    child: HeroBannerCarouselSlider(
                      slides: sliderController.slideList,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildSectionHeader(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategoryScreen();
                },
              ),
              const SizedBox(height: 12),
              _getCategoryList(),
              const SizedBox(height: 8),
              _buildSectionHeader(title: "Popular", onTapSeeAll: () {}),
              const SizedBox(height: 4),
              _getPopularProduct(),
              const SizedBox(height: 4),
              _buildSectionHeader(title: "Special", onTapSeeAll: () {}),
              const SizedBox(height: 4),
              _getSpecialProduct(),
              const SizedBox(height: 4),
              _buildSectionHeader(title: "New", onTapSeeAll: () {}),
              const SizedBox(height: 4),
              _getNewProduct(),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navAppLogoSvg),
      actions: [
        _buildActionButton(iconData: Icons.person_3_outlined, onTap: () {}),
        const SizedBox(width: 8),
        _buildActionButton(iconData: Icons.call_outlined, onTap: () {}),
        const SizedBox(width: 8),
        _buildActionButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.black.withValues(alpha: 0.05),
        child: Icon(iconData, color: Colors.black54, size: 18),
      ),
    );
  }

  Row _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text("See All", style: TextStyle(color: AppColors.themeColor)),
        ),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.initialLoadingInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: ListView.builder(
              itemCount: categoryController.categoryLength,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCategoryItem(
                  category: categoryController.categoryList[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getSpecialProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ...[1, 2, 3, 4].map((product) => ProductCard()),
        ],
      ),
    );
  }

  Widget _getPopularProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ...[1, 2, 3, 4].map((product) => ProductCard()),
        ],
      ),
    );
  }

  Widget _getNewProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          ...[1, 2, 3, 4].map((product) => ProductCard()),
        ],
      ),
    );
  }
}
