import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/register_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_bar.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:get/get.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RouteNames.splashScreen, page: () => SplashScreen()),
    GetPage(name: RouteNames.loginScreen, page: () => LoginScreen()),
    GetPage(name: RouteNames.registerScreen, page: () => RegisterScreen()),
    GetPage(name: RouteNames.otpVerificationScreen, page: () => OtpVerificationScreen(email: Get.arguments as String)),
    GetPage(name: RouteNames.mainBottomNavBarScreen, page: () => MainBottomNavBar()),
    GetPage(name: RouteNames.productListScreen, page: () => ProductListScreen(category: Get.arguments! as CategoryModel)),
    GetPage(name: RouteNames.productDetailsScreen, page: () => ProductDetailsScreen()),
  ];
}