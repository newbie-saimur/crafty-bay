import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/product_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/home/ui/controllers/hero_banner_carousel_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/build_section_header.dart';
import 'package:crafty_bay/features/home/ui/widgets/get_products_by_category.dart';
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
  final ProductListController _popularProductListController =
      ProductListController();
  final ProductListController _specialProductListController =
      ProductListController();
  final ProductListController _newArrivalProductListController =
      ProductListController();

  @override
  void initState() {
    super.initState();
    _popularProductListController.getProductListByCategory(
      Constants.popularProductCategoryId,
    );
    _specialProductListController.getProductListByCategory(
      Constants.specialProductCategoryId,
    );
    _newArrivalProductListController.getProductListByCategory(
      Constants.newArrivalProductCategoryId,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.sizeOf(context).width;
    bool isPhone = screenSize < 600;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              ProductSearchBar(),
              const SizedBox(height: 12),
              GetBuilder<HeroBannerCarouselController>(
                builder: (sliderController) {
                  if (sliderController.errorMessage != null) {
                    return SizedBox(
                      height: screenSize * 0.5 + 12,
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
                      height: screenSize * 0.5 + 12,
                      child: CenteredCircularProgressIndicator(),
                    ),
                    child: HeroBannerCarouselSlider(
                      slides: sliderController.slideList,
                    ),
                  );
                },
              ),
              SizedBox(height: isPhone ? 6 : 12),
              BuildSectionHeader(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategoryScreen();
                },
              ),
              const SizedBox(height: 4),
              _getCategoryList(),
              SizedBox(height: isPhone ? 12 : 16),
              GetProductsByCategory(
                model: CategoryModel.fromIdAndTitle(
                  id: Constants.popularProductCategoryId,
                  title: "Popular",
                ),
                controller: _popularProductListController,
              ),
              SizedBox(height: isPhone ? 4 : 8),
              GetProductsByCategory(
                model: CategoryModel.fromIdAndTitle(
                  id: Constants.specialProductCategoryId,
                  title: "Special",
                ),
                controller: _specialProductListController,
              ),
              SizedBox(height: isPhone ? 4 : 8),
              GetProductsByCategory(
                model: CategoryModel.fromIdAndTitle(
                  id: Constants.newArrivalProductCategoryId,
                  title: "New Arrival",
                ),
                controller: _newArrivalProductListController,
              ),
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

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.initialLoadingInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: ListView.separated(
              itemCount: categoryController.categoryLength,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FittedBox(
                  child: ProductCategoryItem(
                    category: categoryController.categoryList[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },
            ),
          );
        },
      ),
    );
  }
}
