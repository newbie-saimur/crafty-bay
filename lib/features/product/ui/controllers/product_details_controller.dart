import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/product/data/models/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProductDetailsModel? _productDetails;
  ProductDetailsModel? get productDetails => _productDetails;

  Future<NetworkResponse> getProductDetails(String productId) async {
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productDetailsUrl(productId: productId),
    );

    if (response.isSuccess) {
      _productDetails = ProductDetailsModel.fromJson(response.data!['data']);
    } else {
      _errorMessage = response.errorMessage ?? response.data!['msg'];
    }

    _inProgress = false;
    update();

    return response;
  }
}
