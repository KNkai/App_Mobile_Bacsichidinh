import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/home_list_customer.dart';
import 'components/home_quick_booking.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    final AnalyticsController analyticsController = Get.find();
    return AppScaffold(
      // isRefresh: false,
      // isAppBar: true,
      child: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarCustom.appBarLogo(),
              Text(
                'Xin Chào, ${controller.currentUser!.fullname ?? ''}',
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
                        text: analyticsController
                                .medAffiliateReport
                                .value
                                .medAffiliateReportCombine
                                .medCommissionCurrent
                                .currentLevelName ??
                            "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: subTitleSize,
                          color: AppColor.second,
                        ),
                      ),
                      TextSpan(
                        text:
                            ". ${analyticsController.medAffiliateReport.value.medAffiliateReportCombine.med.medTotals ?? 0} lượt chỉ định",
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.kConstantPadding * 2),
                child: Column(
                  children: [
                    HomeQuickBooking(),
                    const SizedBox(height: AppSize.kConstantPadding * 2),
                    HomeListCustomer(),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.kConstantPadding * 3),
            ],
          ),
        );
      }),
    );
  }
}
