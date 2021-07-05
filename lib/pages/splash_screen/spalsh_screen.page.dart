import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'splash_screen.controller.dart';

class SplashScreenPage extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isAppBar: false,
      isBackButton: false,
      isCenterTitle: false,
      isNoti: false,
      // isRefresh: false,
      isShowCart: false,
      isShowOrder: false,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAsset.logo_white),
                ),
                // color: AppColor.primary,
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding * 2),
            Container(
              width: Get.width,
              height: (Get.width * 0.2) / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAsset.logo_text_white),
                ),
                // color: AppColor.primary,
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding * 4),
            Container(
              width: double.infinity,
              child: Center(
                child: SpinKitThreeBounce(
                  color: AppColor.loading,
                  size: 20.0,
                  controller: controller.animationController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
