import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_navbar.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SuccessRegMedPage extends StatelessWidget {
  SuccessRegMedPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final AnalyticsController analyticsController = Get.find();
  // final AppNavBarController appNavBarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.width,
            child: AppCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAsset.logo,
                    width: Get.width * (2 / 3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSize.kConstantPadding * 3),
                    child: Text(
                      "Đăng ký chỉ định thành công".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleSize,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.kConstantPadding * 3),
                  AppBtn(
                    title: 'Xác Nhận',
                    onClick: () {
                      // Get.reset();
                      // Get.put<AppScaffoldController>(AppScaffoldController(),
                      //     permanent: true);
                      homeController.onDelete();
                      analyticsController.onDelete();
                      // appNavBarController.onDelete();

                      // appNavBarController.onInit();
                      homeController.onInit();
                      // homeController.update();
                      analyticsController.onInit();
                      // Get.put<HomeController>(HomeController(),
                      //     permanent: true);
                      // Get.put<AnalyticsController>(AnalyticsController(),
                      //     permanent: true);
                      Get.offAll(AppNavBar());
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (_) => AppNavBar()),
                      //     (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
