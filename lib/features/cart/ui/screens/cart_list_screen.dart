import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
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
          title: Text("Cart"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.black.withValues(alpha: 0.05)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20,
              crossAxisSpacing: 4,
            ),
            itemCount: 16,
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCategoryItem());
            },
          ),
        ),
      ),
    );
  }
}
