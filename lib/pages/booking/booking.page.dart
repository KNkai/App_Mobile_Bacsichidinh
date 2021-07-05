import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/booking_list.model.dart';
import 'package:app_mobile_bacsichidinh/pages/booking_detail/booking_detail.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking.controller.dart';

class BookingPage extends StatelessWidget {
  const BookingPage();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<BookingController>(
        init: BookingController(),
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("khách hàng đã được chỉ định",
                  isBack: false),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Trạng thái:  "),
                    ),
                    Obx(
                      () => Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            onChanged: (_) {
                              controller.currentTypeFilter.value = _!;
                              controller.getAppointments();
                            },
                            value: controller.currentTypeFilter.value,
                            items: List.generate(
                              3,
                              (index) => DropdownMenuItem<int>(
                                value: index,
                                child: Text(
                                  "${listFilter[index]}",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var item in controller.appointments.value
                              .medCommissionCombine!.listMedCommission!)
                            AppCard(
                              child: Container(
                                padding: const EdgeInsets.all(
                                    AppSize.kConstantPadding),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: item.anh == null
                                          ? Image.asset(AppAsset.avatar)
                                          : Image.network(item.anh),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.hoTen!,
                                                style: TextStyle(
                                                  color: AppColor.primary,
                                                  fontSize: titleSize - 3,
                                                ),
                                              ),
                                              Text(
                                                "${item.medTrangThai == "Done" ? "Đã có kết quả" : "Đang chờ"}",
                                                style: TextStyle(
                                                  color: item.medTrangThai ==
                                                          "Done"
                                                      ? AppColor.primary
                                                      : AppColor.second,
                                                  fontSize: titleSize - 8,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (item.chanDoanChinh!
                                                  .trim()
                                                  .toString() !=
                                              "")
                                            Column(
                                              children: [
                                                const SizedBox(
                                                    height: AppSize
                                                            .kConstantPadding /
                                                        2),
                                                Text(
                                                  "Chẩn đoán: ${item.chanDoanChinh}",
                                                  style: TextStyle(
                                                    color: AppColor.boldGrey,
                                                    fontSize: miniTitleSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          if (item.ghiChu!.trim().toString() !=
                                              "")
                                            Column(
                                              children: [
                                                const SizedBox(
                                                    height: AppSize
                                                            .kConstantPadding /
                                                        2),
                                                Text(
                                                  "Ghi chú: ${item.ghiChu}",
                                                  style: TextStyle(
                                                    color: AppColor.boldGrey,
                                                    fontSize: miniTitleSize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          const SizedBox(
                                              height:
                                                  AppSize.kConstantPadding / 2),
                                          Text(
                                            interpolate([
                                              item.diaChi ?? "",
                                              item.tenPhuongXa ?? "",
                                              item.tenQuanHuyen ?? "",
                                              item.tenTinhThanh ?? ""
                                            ]),
                                            style: TextStyle(
                                              color: AppColor.boldGrey,
                                              fontSize: miniTitleSize,
                                            ),
                                          ),
                                          const SizedBox(
                                              height:
                                                  AppSize.kConstantPadding / 2),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (item.medTrangThai ==
                                                    "InProgress")
                                                  TextButton(
                                                    onPressed: () => Get.to(
                                                      BookingDetail(
                                                        customerId: item.maBn!,
                                                      ),
                                                      preventDuplicates: true,
                                                    ),
                                                    child: Text(
                                                      'Xem phiếu',
                                                      style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: subTitleSize,
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith<
                                                                  Color>(
                                                        (Set<MaterialState>
                                                            states) {
                                                          if (states.contains(
                                                              MaterialState
                                                                  .pressed))
                                                            return AppColor
                                                                .primary
                                                                .withOpacity(
                                                                    0.5);
                                                          return AppColor
                                                              .primary; // Use the component's default.
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                const SizedBox(
                                                    width: AppSize
                                                        .kConstantPadding),
                                                if (item.medTrangThai == "Done")
                                                  TextButton(
                                                    onPressed: () => Get.to(
                                                      BookingDetail(
                                                        customerId: item.maBn!,
                                                        isDone: true,
                                                      ),
                                                      preventDuplicates: true,
                                                    ),
                                                    child: Text(
                                                      'Xem kết quả',
                                                      style: TextStyle(
                                                        color: AppColor.white,
                                                        fontSize: subTitleSize,
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith<
                                                                  Color>(
                                                        (Set<MaterialState>
                                                            states) {
                                                          if (states.contains(
                                                              MaterialState
                                                                  .pressed))
                                                            return AppColor
                                                                .primary
                                                                .withOpacity(
                                                                    0.5);
                                                          return AppColor
                                                              .primary; // Use the component's default.
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    )),
              ),
              // for (var item in demoBookingModel.listBookingCustomer!)
            ],
          );
        },
      ),
    );
  }
}
