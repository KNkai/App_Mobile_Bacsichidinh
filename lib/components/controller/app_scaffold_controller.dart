import 'package:app_mobile_bacsichidinh/pages/settings/setting.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppScaffoldController extends GetxController {
  PageController? navigatorController;
  final box = GetStorage();
  // int get cartQuantity {
  //   return appController.cartsItemModel.length;
  // }

  BackgroundSettingModel? settingBg;

  @override
  void onInit() async {
    await box.writeIfNull(
        AppKey.settingBackground, BackgroundSettingModel(1, 1, "#ffffff"));
    await 1.delay();
    if (box.read(AppKey.settingBackground) != null) {
      settingBg =
          BackgroundSettingModel.fromJson(box.read(AppKey.settingBackground));
    }

    print(settingBg);
    navigatorController =
        PageController(keepPage: true, initialPage: 2, viewportFraction: 1);
    super.onInit();
  }

  void openDrawerInHere(GlobalKey<ScaffoldState> drawerKey) {
    drawerKey.currentState!.openDrawer();
  }
}
