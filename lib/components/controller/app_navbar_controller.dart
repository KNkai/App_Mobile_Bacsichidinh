import 'package:app_mobile_bacsichidinh/pages/booking/booking.page.dart';
import 'package:app_mobile_bacsichidinh/pages/document/document.page.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.page.dart';
import 'package:app_mobile_bacsichidinh/pages/notification/notification.page.dart';
import 'package:app_mobile_bacsichidinh/pages/profile/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_keep_alive_widget.dart';

class AppNavBarController extends GetxController {
  PageController? _navigatorController;
  // AuthController authController = Get.find();

  RxList<Widget> listPage = RxList<Widget>();

  // int get cartQuantity {
  //   // return appController.cartsItemModel.length;
  // }

  PageController get pageController => this._navigatorController!;
  @override
  void onInit() {
    listPage.clear();
    listPage.add(KeepAliveWidget(const DocumentPage()));
    listPage.add(KeepAliveWidget(const BookingPage()));
    listPage.add(KeepAliveWidget(const HomePage()));
    listPage.add(KeepAliveWidget(const NotificationPage()));
    listPage.add(KeepAliveWidget(const ProfilePage()));
    _navigatorController = PageController(keepPage: true, initialPage: 2);
    super.onInit();
  }

  void openDrawerInHere(GlobalKey<ScaffoldState> drawerKey) {
    drawerKey.currentState?.openDrawer();
  }
}
