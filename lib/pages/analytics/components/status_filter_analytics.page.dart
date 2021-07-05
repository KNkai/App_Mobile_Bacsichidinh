import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusFilter extends StatelessWidget {
  const StatusFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnalyticsController controller = Get.find();
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSize.kConstantPadding * 2),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<FilterAnalyticsType>(
            isExpanded: true,
            value: controller.currentType.value,
            items: List.generate(
              FilterAnalyticsTypeModel.listFilterAnalytics.length,
              (index) => new DropdownMenuItem<FilterAnalyticsType>(
                value: FilterAnalyticsTypeModel
                    .listFilterAnalytics[index].analyticsType,
                child: new Text(
                    FilterAnalyticsTypeModel.listFilterAnalytics[index].title),
              ),
            ),
            onChanged: (_) {
              controller.currentType.value = _!;
            },
          ),
        ),
      ),
    );
  }
}
