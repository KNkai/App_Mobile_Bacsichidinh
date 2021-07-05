import 'package:app_mobile_bacsichidinh/components/app_expansion_tile_card.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_convert.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../booking_detail.controller.dart';

class PhieuChiDinhWidget extends StatelessWidget {
  const PhieuChiDinhWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BookingDetailController>(builder: (controller) {
      return ExpansionTileCard(
        title: Text('Phiếu chỉ định'),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.kConstantPadding * 2,
                vertical: AppSize.kConstantPadding),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Bác sĩ chỉ định: ${controller.phieuchidinh.value.phieu!.bsChiDinh ?? ""}"),
                Text(
                    "Thời gian chỉ định: ${DateFormat('dd-MM-yyyy HH:MM').format(controller.medBookingResult.value.ngayBacSiChiDinh ?? DateTime.now())}"),
                if (controller.medBookingResult.value.bacSiChiDinhGhiChu !=
                    null)
                  Text(
                      "Ghi Chú: ${controller.medBookingResult.value.bacSiChiDinhGhiChu ?? ""}"),
                if (controller.medBookingResult.value.chanDoanChinh != null &&
                    controller.medBookingResult.value.chanDoanChinh!.trim() !=
                        "")
                  Text(
                      "Chẩn đoán: ${controller.medBookingResult.value.chanDoanChinh ?? ""}"),
              ],
            ),
          ),
          const SizedBox(height: AppSize.kConstantPadding),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.kConstantPadding * 2),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tên dịch vụ'),
                Text('Thành tiền'),
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.kConstantPadding),
            child: const Divider(),
          ),
          for (int i = 0;
              i < controller.phieuchidinh.value.chitiet!.length;
              i++)
            if (i == 0)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.kConstantPadding * 2),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.phieuchidinh.value.chitiet![i].tenNhom ??
                              "",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: AppColor.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: Text(controller
                                      .phieuchidinh.value.chitiet![i].ten ??
                                  ""),
                            ),
                          ),
                          const SizedBox(width: AppSize.kConstantPadding),
                          Expanded(
                            flex: 1,
                            child: Text(
                              appCurrency(controller.phieuchidinh.value
                                      .chitiet![i].giaThucTe ??
                                  0),
                              style: TextStyle(fontSize: subTitleSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.kConstantPadding),
                  ],
                ),
              )
            else if (controller.phieuchidinh.value.chitiet![i].tenNhom ==
                controller.phieuchidinh.value.chitiet![i - 1].tenNhom)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.kConstantPadding * 2),
                    child: Container(
                      color: AppColor.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                                controller.phieuchidinh.value.chitiet![i].ten ??
                                    ""),
                          ),
                          const SizedBox(width: AppSize.kConstantPadding),
                          Expanded(
                            flex: 1,
                            child: Text(
                              appCurrency(controller.phieuchidinh.value
                                      .chitiet![i].giaThucTe ??
                                  0),
                              style: TextStyle(fontSize: subTitleSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.kConstantPadding),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.kConstantPadding * 2),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.phieuchidinh.value.chitiet![i].tenNhom ??
                              "",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: AppColor.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                                controller.phieuchidinh.value.chitiet![i].ten ??
                                    ""),
                          ),
                          const SizedBox(width: AppSize.kConstantPadding),
                          Expanded(
                            flex: 1,
                            child: Text(
                              appCurrency(controller.phieuchidinh.value
                                      .chitiet![i].giaThucTe ??
                                  0),
                              style: TextStyle(fontSize: subTitleSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          Container(
            padding: const EdgeInsets.all(AppSize.kConstantPadding),
            width: double.infinity,
            child: Center(
              child: Text(
                "Tổng tiền: ${appCurrency(controller.amountBooking)}".allInCaps,
                style: TextStyle(
                    color: AppColor.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    });
  }
}
