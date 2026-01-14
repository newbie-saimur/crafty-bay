import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/ui/widgets/cart_item.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
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
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 8);
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.themeColor.withValues(alpha: .15),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price", style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400
                        ),),
                        Text(
                          "${Constants.bdtCurrencySign}10,000.00",
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
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
