import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/pin_code_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/register_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_bar.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == RegisterScreen.name) {
      screenWidget = RegisterScreen();
    } else if (settings.name == PinCodeVerificationScreen.name) {
      screenWidget = PinCodeVerificationScreen();
    } else if (settings.name == MainBottomNavBar.name) {
      screenWidget = MainBottomNavBar();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      screenWidget = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      screenWidget = ProductDetailsScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
