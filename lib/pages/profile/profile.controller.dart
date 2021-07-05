import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final HomeController homeController = Get.find();
  final AnalyticsController analyticsController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  logout(BuildContext context) async {
    print('co rerun');
  }

  // getCurrentUser() {
  //   if (box.read(AppKey.currentUserKey) != null) {
  //     currentUser = Users.fromJson(box.read(AppKey.currentUserKey));
  //   }
  // }
}
