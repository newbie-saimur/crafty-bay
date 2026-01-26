import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  int _currentIndex = 0;
  int get selectedIndex => _currentIndex;

  void updateIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    update();
  }

  void moveToCategoryScreen() {
    updateIndex(1);
  }

  void moveToCartScreen() {
    updateIndex(2);
  }

  void moveToWishListScreen() {
    updateIndex(3);
  }

  void backToHome() {
    updateIndex(0);
  }
}
