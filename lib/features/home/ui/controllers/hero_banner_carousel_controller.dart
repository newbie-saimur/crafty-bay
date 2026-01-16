import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/home/data/models/hero_banner_slider_model.dart';
import 'package:get/get.dart';

class HeroBannerCarouselController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<HeroBannerSliderModel> _slideList = [];
  List<HeroBannerSliderModel> get slideList => _slideList;

  Future<void> getSlides() async {
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.homeBannerCarouselSliderUrl,
    );

    if (response.isSuccess) {
      List<HeroBannerSliderModel> list = [];
      for(Map<String,dynamic> slide in response.data!['data']['results']) {
        list.add(HeroBannerSliderModel.fromJson(slide));
      }
      _slideList = list.reversed.toList();
    } else {
      _errorMessage = response.errorMessage ?? response.data!['msg'];
    }

    _inProgress = false;
    update();
  }
}
