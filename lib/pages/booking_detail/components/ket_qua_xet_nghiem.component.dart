import 'package:app_mobile_bacsichidinh/components/app_expansion_tile_card.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../booking_detail.controller.dart';

class KetQuaXetNghiemWidget extends StatelessWidget {
  const KetQuaXetNghiemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BookingDetailController>(builder: (controller) {
      return ExpansionTileCard(
        title: Text('Kết quả xét nghiệm'),
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
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Tiếp nhận: ${DateFormat('dd-MM-yyyy HH:MM').format(controller.phieuxetnghiem.value.phieu!.tgTiepNhan!)}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Thực hiện: ${DateFormat('dd-MM-yyyy HH:MM').format(controller.phieuxetnghiem.value.phieu!.tgThucHien!)}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Trả kết quả: ${DateFormat('dd-MM-yyyy HH:MM').format(controller.phieuxetnghiem.value.phieu!.tgTraKq!)}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Người thực hiện: ${controller.phieuxetnghiem.value.phieu!.nguoiThucHien ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Nơi thực hiện: ${controller.phieuxetnghiem.value.phieu!.noiThucHien ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppSize.kConstantPadding / 2),
                  child: Text(
                      "Kết luận: ${controller.phieuxetnghiem.value.phieu!.ketLuan ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.kConstantPadding),
                  child: Divider(),
                ),
                for (var item in controller.phieuxetnghiem.value.chitiet!)
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('${item.tenXn}')),
                          Expanded(
                            child: Center(
                              child: Text(
                                '${item.ketQua}',
                                style: TextStyle(
                                    color: item.binhThuong!
                                        ? Colors.black
                                        : item.lechDuoi!
                                            ? AppColor.second
                                            : Colors.red),
                              ),
                            ),
                          ),
                          Expanded(child: Text('${item.csbt}')),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('${item.donVi ?? ""}'),
                            ],
                          )),
                        ],
                      ),
                      Divider(),
                    ],
                  )
              ],
            ),
          ),
        ],
      );
    });
  }
}
