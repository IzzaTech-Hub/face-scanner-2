import 'package:face_scanner/app/providers/admob_ads_provider.dart';
import 'package:get/get.dart';

class HomeViewCtl extends GetxController {
  @override
  void onInit() {
AdMobAdsProvider.instance.initialize();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
