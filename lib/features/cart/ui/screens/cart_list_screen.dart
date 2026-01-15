import 'package:crafty_bay/features/cart/ui/widgets/cart_item.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_price_button_banner.dart';
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
      onPopInvokedWithResult: (_, _) {
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CartItem();
                  },
                  separatorBuilder: (_, _) {
                    return const SizedBox(height: 8);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            ProductPriceButtonBanner(
              price: 10000,
              buttonText: "Checkout",
              priceLabel: "Total Price",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
