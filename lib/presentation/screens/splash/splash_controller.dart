import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';

import '../../../routes/route_constant.dart';

class SplashController extends GetxController {
  final pref = GetStorage();

  final box = GetStorage();
  @override
  void onReady() {
    super.onReady();
    BatteryOptimization.checkAndRequestBatteryOptimizations();
    Future.delayed(const Duration(seconds: 3), () {
      // FirebaseNotification().setUpFirebase(onDidReceiveLocalNotification);
      bool isLogin = pref.read('isLogin') ?? false;
      if (isLogin) {
        Get.offAllNamed(AppRoutes.mainApp);
      } else {
        pref.read('onboarding') ?? false
            ? Get.offAndToNamed(AppRoutes.login)
            : Get.offAndToNamed(AppRoutes.onboarding);
      }
    });
  }
}

class BatteryOptimization {
  static const platform =
      MethodChannel('com.clinic.endurance_app/battery_optimizations');

  static Future<void> checkAndRequestBatteryOptimizations() async {
    try {
      await platform.invokeMethod('checkAndRequestBatteryOptimizations');
    } on PlatformException catch (e) {
      print(
          "Failed to check or request battery optimizations: '${e.message}'.");
    }
  }
}
