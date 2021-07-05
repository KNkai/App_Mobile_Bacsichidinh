import 'package:app_mobile_bacsichidinh/components/app_expanded_pageview.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/login/login.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'components/otp_widget.login.dart';
import 'components/phone_widget.login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return AppScaffold(
      isAppBar: false,
      isBackButton: false,
      isCenterTitle: false,
      isNoti: false,
      // isRefresh: false,
      isShowCart: false,
      isShowOrder: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        child: Image.asset(
                          AppAsset.bg_wallthrough,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'logo_bg_white',
                            child: Image.asset(
                              AppAsset.logo_bg_white,
                              width: 90,
                              height: 90,
                            ),
                          ),
                          const SizedBox(height: AppSize.kConstantPadding * 3),
                          Hero(
                            tag: 'logo_text',
                            child: SvgPicture.asset(
                              AppAsset.logo_text,
                              fit: BoxFit.fitWidth,
                              allowDrawingOutsideViewBox: false,
                              color: AppColor.white,
                              width: Get.width / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpandablePageView(
                  pageController: controller.pageController,
                  isScroll: false,
                  children: [
                    PhoneWidget(),
                    OTPWidget(),
                  ],
                ),
              ],
            ),
          ),
          if (controller.box.read(AppKey.isFirstTime) == null)
            Positioned(
              top: 40,
              left: 20,
              child: InkWell(
                onTap: () => controller.onBack(),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColor.white,
                ),
              ),
            ),
          Positioned(
            top: 40,
            right: 20,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.more_horiz_outlined,
                color: AppColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
