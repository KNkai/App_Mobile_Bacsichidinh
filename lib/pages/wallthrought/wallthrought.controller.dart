import 'package:app_mobile_bacsichidinh/pages/wallthrought/wallthrought.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WallthroughtController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController? pageController;
  RxInt? currentPage = 0.obs;
  var box = GetStorage();
  final List<Widget> page = [
    Wallthrought1(logo: AppAsset.bg_wallthrough_1),
    Wallthrought1(logo: AppAsset.bg_wallthrough_2),
    Wallthrought1(logo: AppAsset.bg_wallthrough_3),
  ];

  @override
  void onInit() {
    if (box.hasData(AppKey.currentUserKey) == false)
      box.writeIfNull(AppKey.isFirstTime, true);
    pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0);

    super.onInit();
  }
}
