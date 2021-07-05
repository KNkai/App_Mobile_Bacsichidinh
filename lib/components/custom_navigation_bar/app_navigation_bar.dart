import 'package:app_mobile_bacsichidinh/components/custom_navigation_bar/app_navigation_bar_controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  const AppNavigationBar({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final AppNavigationBarController controller =
    //     Get.put(AppNavigationBarController());
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColor.primary, AppColor.primary.withOpacity(0.8)],
            stops: [0.0, 0.8]),
        // borderRadius: BorderRadius.circular(30),
      ),
      child: GetX<AppNavigationBarController>(
        init: AppNavigationBarController(),
        builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              controller.listIcon.length,
              (index) => InkWell(
                child: controller.listIcon[index].active
                    ? controller.listIcon[index].itemActive
                    : controller.listIcon[index].item,
                onTap: () {
                  controller.onClickItem(index);
                  onTap(index);
                  controller.listIcon.refresh();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemBottomNavigationBar extends StatelessWidget {
  final bool active;
  final String icon, iconActive;
  final bool isNoti;

  const ItemBottomNavigationBar({
    Key? key,
    required this.icon,
    required this.iconActive,
    this.active = false,
    this.isNoti = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: active ? AppColor.second : AppColor.primary,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: SvgPicture.asset(
                active ? iconActive : icon,
                width: 30,
                height: 30,
              ),
            ),
          ),
          if (isNoti == true &&
              homeController.currentUser!.messageUnreadCount! != 0)
            Positioned(
              right: 0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active ? AppColor.primary : AppColor.second,
                    border: Border.all(width: 1, color: AppColor.white)),
                child: Center(
                  child: Text(
                    '${homeController.currentUser!.messageUnreadCount!}',
                    style: TextStyle(
                      fontSize: subTitleSize,
                      color: active ? AppColor.white : AppColor.primary,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
