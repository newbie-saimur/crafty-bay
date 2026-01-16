import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_request_model.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  bool _resendOtpInProgress = false;
  bool get resendOtpInProgress => _resendOtpInProgress;

  String? _message;
  String? get message => _message;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<NetworkResponse> verifyOtp(VerifyOtpRequestModel model) async {
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      Urls.verifyOtpUrl,
      body: model.toJson(),
    );

    if (response.isSuccess) {
      _message = response.data!['msg'];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return response;
  }

  Future<bool> resendOtp(String email) async {
    bool isSuccess = false;
    _resendOtpInProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      Urls.resendOtpUrl,
      body: {"email" : email},
    );

    if (response.isSuccess) {
      _message = response.data!['msg'];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _resendOtpInProgress = false;
    update();

    return isSuccess;
  }
}
