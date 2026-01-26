import 'package:crafty_bay/features/cart/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/hero_banner_carousel_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/home_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_category_screen.dart';
import 'package:crafty_bay/features/wish-list/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  void initState() {
    super.initState();
    Get.find<HeroBannerCarouselController>().getSlides();
    Get.find<CategoryListController>().getCategoryList();
  }

  final _screens = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavBarController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.updateIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.grid_view_outlined), label: "Category"),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
              NavigationDestination(icon: Icon(Icons.card_giftcard), label: "Wish"),
            ],
          ),
        );
      },
    );
  }
}
