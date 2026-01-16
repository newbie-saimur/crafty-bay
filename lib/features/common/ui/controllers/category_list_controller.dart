import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  bool _initialLoadingInProgress = false;
  bool get initialLoadingInProgress => _initialLoadingInProgress;

  final int _count = 28;
  int _currentPage = 0;
  int? _lastPage;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  int get categoryLength => _categoryList.length > 10 ? 10 : _categoryList.length;

  Future<void> getCategoryList() async {
    _currentPage++;

    if(_currentPage == 1) {
      _initialLoadingInProgress = true;
      _categoryList.clear();
    } else {
      _inProgress = true;
    }
    update();

    if(_lastPage != null && _lastPage! < _currentPage) {
      _inProgress = false;
      update();
      return;
    }

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productCategoryListUrl(count: _count, currentPage: _currentPage),
    );

    if (response.isSuccess) {
      _lastPage = response.data!['data']['last_page'];
      List<CategoryModel> list = [];
      for (Map<String, dynamic> category in response.data!['data']['results']) {
        list.add(CategoryModel.fromJson(category));
      }
      _categoryList.addAll(list);
    } else {
      _errorMessage = response.errorMessage ?? response.data!['msg'];
    }

    if(_currentPage == 1) {
      _initialLoadingInProgress = false;
    } else {
      _inProgress = false;
    }
    update();
  }
}
