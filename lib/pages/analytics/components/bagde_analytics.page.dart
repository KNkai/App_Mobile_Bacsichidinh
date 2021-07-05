import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeAnalytics extends StatelessWidget {
  const BadgeAnalytics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalyticsController controller = Get.find();
    return Container(
      padding: const EdgeInsets.all(AppSize.kConstantPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(AppSize.kConstantPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primary.withOpacity(0.1),
            ),
            child: Obx(
              () => selectBagde(controller
                      .medAffiliateReport
                      .value
                      .medAffiliateReportCombine
                      .medCommissionCurrent
                      .currentLevelName ??
                  ''),
            ),
          ),
          const SizedBox(width: AppSize.kConstantPadding * 2),
          Expanded(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng lượt đã chỉ định",
                        style: TextStyle(fontSize: subTitleSize),
                      ),
                      Text(
                        "${controller.medAffiliateReport.value.medAffiliateReportCombine.med.medTotals ?? 0} lượt",
                        style: TextStyle(fontSize: miniTitleSize),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng lượt đã thực hiện",
                        style: TextStyle(fontSize: subTitleSize),
                      ),
                      Text(
                        "${controller.medAffiliateReport.value.medAffiliateReportCombine.med.medSuccess ?? 0} lượt",
                        style: TextStyle(fontSize: miniTitleSize),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng lượt hủy",
                        style: TextStyle(fontSize: subTitleSize),
                      ),
                      Text(
                        "${controller.medAffiliateReport.value.medAffiliateReportCombine.med.medCancel ?? 0} lượt",
                        style: TextStyle(fontSize: miniTitleSize),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng lượt đang chờ",
                        style: TextStyle(fontSize: subTitleSize),
                      ),
                      Text(
                        "${controller.medAffiliateReport.value.medAffiliateReportCombine.med.medWaiting ?? 0} lượt",
                        style: TextStyle(fontSize: miniTitleSize),
                      ),
                    ],
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

selectBagde(String level) {
  if (level == "Standard") {
    return Image.asset(AppAsset.ic_badge_1);
  } else if (level == "Gold") {
    return Image.asset(AppAsset.ic_badge_2);
  } else if (level == "Premium") {
    return Image.asset(AppAsset.ic_badge_3);
  } else {
    return Image.asset(AppAsset.ic_badge_1);
  }
}
