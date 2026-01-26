import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controllers/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/hero_banner_carousel_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(AuthController());
    Get.put(
      NetworkClient(
        onUnauthorize: _onUnauthorize,
        commonHeaders: _commonHeaders,
      ),
    );
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(LoginController());
    Get.put(HeroBannerCarouselController());
    Get.put(CategoryListController());
  }

  Future<void> _onUnauthorize() async {
    await Get.find<AuthController>().clearUserData();
    Get.toNamed(RouteNames.loginScreen);
  }

  Map<String, String> _commonHeaders() {
    final authController = Get.find<AuthController>();
    return {
      "Content-Type": "application/json",
      "token": authController.userToken ?? "",
    };
  }
}
