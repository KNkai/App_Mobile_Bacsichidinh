import 'package:app_mobile_bacsichidinh/components/custom_navigation_bar/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/app_navbar_controller.dart';

class AppNavBar extends GetWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  // static void push(BuildContext context) {
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => AppNavBar()), (route) => false);
  // }

  // final AuthController authController = Get.put(AuthController());
  final AppNavBarController controller = Get.put(AppNavBarController());
  final _stateIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      // drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: controller.listPage,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _stateIndex,
        builder: (_, index, ___) {
          return AppNavigationBar(
            onTap: (_) {
              _stateIndex.value = _;
              controller.pageController.animateToPage(
                _,
                curve: Curves.easeInOutQuart,
                duration: const Duration(milliseconds: 170),
              );
            },
          );
        },
      ),
    );
  }
}
