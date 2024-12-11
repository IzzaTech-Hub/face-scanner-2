import 'package:face_scanner/app/routes/app_pages.dart';
import 'package:face_scanner/app/services/remoteconfig_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var tabIndex = 0.obs;
  Rx<int> percent = 0.obs;
  Rx<bool> isLoaded = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await RemoteConfigService().initialize();

    // AppLovinProvider.instance.init();

    Get.offNamed(Routes.HOMEVIEW);

    // prefs.then((SharedPreferences pref) {
    //   isFirstTime = pref.getBool('first_time') ?? true;

    //   print("Is First Time from Init: $isFirstTime");
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void setFirstTime(bool bool) {
  //   prefs.then((SharedPreferences pref) {
  //     pref.setBool('first_time', bool);
  //     print("Is First Time: $isFirstTime");
  //   });
  // }
}
