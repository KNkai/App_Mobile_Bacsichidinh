import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.page.dart';
import 'package:app_mobile_bacsichidinh/pages/profile/profile.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/profile_update/profile_update.page.dart';
import 'package:app_mobile_bacsichidinh/pages/settings/setting.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/list_tile_profile.profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // isRefresh: false,
      isAppBar: true,
      // appBar: AppBarCustom.appBarProfile2(),
      child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBarCustom.appBarProfile(
                    controller.homeController.currentUser!.avatarPath!,
                    "Tài Khoản Cá Nhân",
                    Hero(
                      tag: 'appbar_profile',
                      child: Material(
                        color: Colors.transparent,
                        child: CircleAvatarCustom(
                          imageAvatar: controller
                              .homeController.currentUser!.avatarPath!,
                        ),
                      ),
                    ),
                  ),

                  Text.rich(
                    TextSpan(
                      children: [
                        if (false)
                          WidgetSpan(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                            ),
                          ),
                        WidgetSpan(
                          child: SizedBox(
                            width: AppSize.kConstantPadding,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Xin Chào, ${controller.homeController.currentUser!.fullname ?? ''}',
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: AppSize.kConstantPadding,
                          ),
                        ),
                        if (false)
                          WidgetSpan(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: InkWell(
                                child: Icon(Icons.edit),
                                onTap: () => Get.to(ProfileUpdate()),
                              ),
                            ),
                          ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Thành viên ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: subTitleSize,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                .analyticsController
                                .medAffiliateReport
                                .value
                                .medAffiliateReportCombine
                                .medCommissionCurrent
                                .currentLevelName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: subTitleSize,
                              color: AppColor.second,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". ${controller.analyticsController.medAffiliateReport.value.medAffiliateReportCombine.med.medTotals} lượt chỉ định",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: subTitleSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSize.kConstantPadding * 2,
                        horizontal: AppSize.kConstantPadding * 3),
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppSize.kConstantPadding * 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Tham gia: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "1.4.2021",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.second,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Bạn còn 17 lượt chỉ định nữa  nữa bạn sẽ trở thành Gold ',
                              style: TextStyle(
                                fontSize: subTitleSize,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppSize.kConstantPadding,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          AppAsset.ic_badge_1,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          AppAsset.ic_badge_2,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          AppAsset.ic_badge_3,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: AppSize.kConstantPadding),
                                  Stack(
                                    children: [
                                      Container(
                                        width: Get.width -
                                            (AppSize.kConstantPadding * 4),
                                        height: AppSize.kConstantPadding / 2,
                                        decoration: BoxDecoration(
                                          color: AppColor.boldGrey,
                                          borderRadius:
                                              BorderRadius.circular(45),
                                        ),
                                      ),
                                      Container(
                                        width: (Get.width -
                                            (AppSize.kConstantPadding * 4)),
                                        height: AppSize.kConstantPadding / 2,
                                        decoration: BoxDecoration(
                                          color: AppColor.price,
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue,
                                              Colors.red,
                                              Colors.yellow
                                            ],
                                            stops: [
                                              0,
                                              0.5,
                                              0.7,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///List button chức năng
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.kConstantPadding * 3),
                    child: AppCard(
                      borderRadius: 5,
                      child: Column(
                        children: [
                          ListTileProfile(
                            icon: Icons.analytics_outlined,
                            title: "Thống kê doanh thu - lượt chỉ định",
                            onClick: () => Get.to(AnalyticPage()),
                          ),
                          ListTileProfile(
                            icon: Icons.notifications_outlined,
                            title: "Quản lý thông báo",
                            onClick: () => print('Quản lý thông báo'),
                          ),
                          ListTileProfile(
                            icon: Icons.settings_rounded,
                            title: "Cài đặt chung",
                            onClick: () => Get.to(SettingPage()),
                          ),
                          ListTileProfile(
                            icon: Icons.policy_outlined,
                            title: "Thông tin chính sách ưu đãi",
                            onClick: () => print('Thống kê doanh thu'),
                          ),
                          ListTileProfile(
                            icon: Icons.support,
                            title: "Trung tâm trợ giúp",
                            onClick: () => print('Thống kê doanh thu'),
                          ),
                          ListTileProfile(
                            icon: Icons.logout,
                            title: "Đăng xuất",
                            onClick: () {},
                            // onClick: () => controller.logout(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.kConstantPadding * 4,
                      horizontal: AppSize.kConstantPadding * 3,
                    ),
                    child: Image.asset(
                      AppAsset.banner,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
