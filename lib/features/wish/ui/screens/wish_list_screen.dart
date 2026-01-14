import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: Get.find<MainBottomNavBarController>().backToHome,
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text("Wish List"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.black.withValues(alpha: 0.05)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 12,
              mainAxisExtent: 230,
            ),
            itemCount: 16,
            itemBuilder: (context, index) {
              return ProductCard();
            },
          ),
        ),
      ),
    );
  }
}
