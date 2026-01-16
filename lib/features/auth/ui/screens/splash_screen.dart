import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      Get.offAllNamed(RouteNames.mainBottomNavBarScreen);
    } else {
      Get.find<AuthController>().clearUserData();
      Get.offAllNamed(RouteNames.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                AppLogo(),
                Spacer(),
                CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text("Version 1.0.0", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
