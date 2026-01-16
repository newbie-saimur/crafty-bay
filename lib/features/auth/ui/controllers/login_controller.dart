import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/login_request_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _message;
  String? get message => _message;

  Future<NetworkResponse> login(LoginRequestModel model) async {
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      Urls.loginUrl,
      body: model.toJson(),
    );

    if (response.isSuccess) {
      _message = response.data!['msg'];
    } else {
      _errorMessage = response.errorMessage ?? response.data!['msg'];
    }

    _inProgress = false;
    update();

    return response;
  }
}
