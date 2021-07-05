import 'package:app_mobile_bacsichidinh/components/app_navbar.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/login/login.page.dart';
import 'package:app_mobile_bacsichidinh/pages/wallthrought/wallthrought.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationController;
  static const Widget wallthrought = WallthroughtPage();
  var box = GetStorage();
  @override
  void onInit() async {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    await 2.delay();
    if (box.hasData(AppKey.isFirstTime)) {
      if (box.hasData(AppKey.saveLogin)) {
        if (box.read(AppKey.saveLogin) == false) {
          Get.offAll(
            LoginPage(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 500),
          );
        } else {
          Get.put<AnalyticsController>(AnalyticsController(), permanent: true);
          Get.offAll(AppNavBar());
        }
      } else {
        Get.offAll(
          LoginPage(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 500),
        );
      }
    } else {
      Get.offAll(
        wallthrought,
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 500),
      );
    }
    super.onInit();
  }
}
