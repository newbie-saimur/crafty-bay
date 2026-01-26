import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  bool _initialLoadingInProgress = false;
  bool get initialLoadingInProgress => _initialLoadingInProgress;

  final int _count = 6;
  int _currentPage = 0;
  int? _lastPage;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  int get productListLength => _productList.length > 6 ? 6 : _productList.length;

  Future<void> getProductListByCategory(String categoryId) async {
    _currentPage++;

    if(_currentPage == 1) {
      _initialLoadingInProgress = true;
      _productList.clear();
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
      Urls.productListUrl(count: _count, currentPage: _currentPage, categoryId: categoryId),
    );

    if (response.isSuccess) {
      if(_currentPage == 1) _lastPage = response.data!['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> product in response.data!['data']['results']) {
        list.add(ProductModel.fromJson(product));
      }
      _productList.addAll(list);
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
