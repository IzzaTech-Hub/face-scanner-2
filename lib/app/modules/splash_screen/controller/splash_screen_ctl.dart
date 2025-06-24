import 'package:get/get.dart';
import 'package:face_scanner/app/providers/admob_ads_provider.dart';
import 'package:face_scanner/app/routes/app_pages.dart';

class SplashController extends GetxController {
  RxInt percent = 0.obs;
  RxBool isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    // AdMobAdsProvider.instance.loadInterstitialAd();
    _startTimerAndAdSequence();
  }

  void _startTimerAndAdSequence() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      percent.value = i;
    }

    bool adShown = false;

AdMobAdsProvider.instance.showInterstitialAd(() {
    adShown = true;
    Get.offNamed(Routes.WORKINGDEMOVIEW);
  });

  // Fallback: if ad not shown in 3 seconds, navigate anyway
  Future.delayed(const Duration(seconds: 3), () {
    if (!adShown) {
      Get.offNamed(Routes.WORKINGDEMOVIEW);
    }
  });
  }
}
