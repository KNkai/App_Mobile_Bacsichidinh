import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/components/app_table.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'components/bagde_analytics.page.dart';
import 'components/item_analytics.page.dart';
import 'components/status_filter_analytics.page.dart';

class AnalyticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: AppBarCustom.appBarNomal("Thống Kê"),
      child: GetBuilder<AnalyticsController>(
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("Thống Kê"),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    left: AppSize.kConstantPadding * 2,
                    right: AppSize.kConstantPadding * 2,
                    bottom: AppSize.kConstantPadding,
                  ),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: [
                        AppCard(
                          child: Obx(
                            () => AppTable(
                              title: "Thống kê doanh thu",
                              action: true
                                  ? const SizedBox.shrink()
                                  : Text('Xem chi tiết'),
                              listItem: [
                                ItemAnalytics(
                                  title: "Tháng trước",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medMoneysLastMonth ??
                                      0,
                                ),
                                ItemAnalytics(
                                  title: "Tháng này",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medMoneysThisMonth ??
                                      0,
                                ),
                                ItemAnalytics(
                                  title: "Tuần trước",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medMoneysLastWeek ??
                                      0,
                                ),
                                ItemAnalytics(
                                  title: "Tuần này",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medThisWeek ??
                                      0,
                                ),
                                ItemAnalytics(
                                  title: "Hôm nay",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medMoneysToday ??
                                      0,
                                ),
                                ItemAnalytics(
                                  title: "Đang chờ",
                                  money: controller
                                          .medAffiliateReport
                                          .value
                                          .medAffiliateReportCombine
                                          .med
                                          .medMoneysWaiting ??
                                      0,
                                  colorMoney: AppColor.price,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding * 3),
                        AppCard(child: BadgeAnalytics()),
                        AppCard(
                          child: StatusFilter(),
                        ),
                        AppCard(
                          child: SfDateRangePicker(
                            onSelectionChanged: controller.onSelectionChanged,
                            selectionMode: DateRangePickerSelectionMode.range,
                            headerStyle: DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center,
                            ),
                            selectionTextStyle:
                                TextStyle(color: AppColor.white),
                            startRangeSelectionColor: AppColor.primary,
                            endRangeSelectionColor: AppColor.primary,
                            rangeSelectionColor:
                                AppColor.primary.withOpacity(0.3),
                            initialSelectedRange: PickerDateRange(
                              // DateTime.now().subtract(
                              //   const Duration(days: 4),
                              // ),
                              // DateTime.now().add(
                              //   const Duration(days: 3),
                              // ),
                              controller.startDate.value,
                              controller.endDate.value,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.all(AppSize.kConstantPadding),
                          width: Get.width / 2,
                          child: AppBtnLoading(
                            controller: controller.filterBtnController,
                            onTap: () async {
                              await controller.getListMedCommission();
                              controller.filterBtnController.success();
                              await 1.delay();
                              controller.filterBtnController.reset();
                            },
                            title: "Lọc kết quả",
                          ),
                        ),
                        AppCard(
                          child: Obx(
                            () => AppTable(
                              title: "Danh sách khách hàng",
                              action: Text(
                                  "${controller.medCommissionAll.value.totalItems} kết quả"),
                              listItem: List.generate(
                                  controller
                                      .medCommissionAll
                                      .value
                                      .medCommissionCombine!
                                      .listMedCommission!
                                      .length, (i) {
                                String add = interpolate([
                                  controller
                                          .medCommissionAll
                                          .value
                                          .medCommissionCombine!
                                          .listMedCommission![i]
                                          .diaChi ??
                                      '',
                                  controller
                                          .medCommissionAll
                                          .value
                                          .medCommissionCombine!
                                          .listMedCommission![i]
                                          .tenPhuongXa ??
                                      '',
                                  controller
                                          .medCommissionAll
                                          .value
                                          .medCommissionCombine!
                                          .listMedCommission![i]
                                          .tenQuanHuyen ??
                                      '',
                                  controller
                                          .medCommissionAll
                                          .value
                                          .medCommissionCombine!
                                          .listMedCommission![i]
                                          .tenTinhThanh ??
                                      ''
                                ]);
                                return ItemTableUser(
                                  name:
                                      '${controller.medCommissionAll.value.medCommissionCombine!.listMedCommission![i].hoTen} (${DateTime.now().year - controller.medCommissionAll.value.medCommissionCombine!.listMedCommission![i].namSinh!} tuổi)',
                                  address:
                                      'Địa chỉ: ${add.trim() == '' ? 'Chưa có địa chỉ' : add} ',
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
